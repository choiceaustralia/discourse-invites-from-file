require 'spec_helper'

RSpec.describe DiscourseInvitesFromFile do
  let(:data) { "hello@example.com\nfoo@example.com\n" }

  before do
    ENV['DISCOURSE_API_URL'] = 'http://localhost:3000'
    ENV['DISCOURSE_API_INPUT'] = 'filename'
    ENV['DISCOURSE_API_USERNAME'] = 'foo'
    ENV['DISCOURSE_API_GROUP_NAMES'] = 'security,support'
  end

  it 'has a client' do
    expect(subject.client).to be_a DiscourseApi::Client
  end

  it 'reads IO' do
    expect(File).to receive(:open).with('filename', 'r', {:universal_newline => false}) { StringIO.new(data) }
    expect(subject.rows).to eq(['hello@example.com','foo@example.com'])
  end

  it 'generates some tokens' do
    allow(File).to receive(:open).with('filename', 'r', {:universal_newline => false}) { StringIO.new(data) }

    expect_any_instance_of(DiscourseApi::Client).to receive(:disposable_tokens).with(
      username: 'foo',
      quantity: 2,
      group_names: 'security,support'
    ).and_return(['footoken', 'bartoken'])

    expect(subject.generate).to eq(
      [
        "#{ENV['DISCOURSE_API_URL']}/invites/redeem/footoken?email=hello@example.com",
        "#{ENV['DISCOURSE_API_URL']}/invites/redeem/bartoken?email=foo@example.com"
      ]
    )
  end
end
