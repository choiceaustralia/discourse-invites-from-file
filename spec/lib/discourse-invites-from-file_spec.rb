require 'spec_helper'

RSpec.describe DiscourseInvitesFromFile do
  let(:data) { "hello@example.com\nfoo@example.com" }

  before do
    ENV['DISCOURSE_API_URL'] = 'http://localhost:3000'
    ENV['DISCOURSE_API_INPUT'] = 'filename'
  end

  it 'has a client' do
    expect(subject.client).to be_a DiscourseApi::Client
  end

  it 'reads IO' do
    expect(File).to receive(:open).with('filename', 'r', {:universal_newline => false}) { StringIO.new(data) }
    expect(subject.rows).to eq data.split("\n")
  end

  it 'generates some tokens' do
    expect_any_instance_of(DiscourseApi::Client).to receive(:disposable_tokens).and_return(['foo'])
    expect(subject.generate).to eq ['foo']
  end
end
