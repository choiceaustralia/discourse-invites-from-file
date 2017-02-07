require 'spec_helper'

RSpec.describe DiscourseInvitesFromFile do
  let(:data) { "hello@example.com\nfoo@example.com\n" }

  before do
    ENV['DISCOURSE_API_URL'] = 'http://localhost:3000'
    ENV['DISCOURSE_API_INPUT'] = 'filename'
    ENV['DISCOURSE_API_USERNAME'] = 'foo'
    ENV['DISCOURSE_API_GROUP_NAMES'] = 'security,support'
    ENV['DISCOURSE_API_TOPIC_ID'] = '8'
  end

  it 'has a client' do
    expect(subject.client).to be_a DiscourseApi::Client
  end

  it 'reads IO' do
    expect(File).to receive(:open).with('filename', 'r', universal_newline: false) { StringIO.new(data) }
    expect(subject.rows).to eq(['hello@example.com', 'foo@example.com'])
  end

  describe 'generate' do
    before do
      allow(File).to receive(:open).with('filename', 'r', universal_newline: false) { StringIO.new(data) }
    end

    let(:results) { ["#{ENV['DISCOURSE_API_URL']}/invites/redeem/footoken?email=hello@example.com&topic=8", "#{ENV['DISCOURSE_API_URL']}/invites/redeem/bartoken?email=foo@example.com&topic=8"] }
    let(:tokens) { %w(footoken bartoken) }
    let(:options) { { username: 'foo', group_names: 'security,support' } }

    it 'generates all the tokens' do
      expect_any_instance_of(DiscourseApi::Client).to receive(:disposable_tokens).with(options.merge(quantity: 2)).and_return(tokens)
      expect(subject.generate).to eq(results)
    end

    it 'generates limited tokens' do
      expect_any_instance_of(DiscourseApi::Client).to receive(:disposable_tokens).with(options.merge(quantity: 1)).and_return([tokens.first])
      expect(subject.generate(1)).to eq([results.first])
    end

    it 'generates limited tokens' do
      expect_any_instance_of(DiscourseApi::Client).to receive(:disposable_tokens).with(options.merge(quantity: 2)).and_return(tokens)
      expect(subject.generate(2)).to eq(results)
    end
  end
end
