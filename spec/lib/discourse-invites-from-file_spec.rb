require 'spec_helper'

RSpec.describe DiscourseInvitesFromFile do
  it 'has a client' do
    expect(subject.client).to be_a DiscourseApi::Client
  end
end
