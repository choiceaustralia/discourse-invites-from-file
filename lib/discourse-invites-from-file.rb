require 'discourse_api'
require 'csv'

class DiscourseInvitesFromFile
  def client
    client = DiscourseApi::Client.new(ENV['DISCOURSE_API_URL'])
    client.api_key = ENV['DISCOURSE_API_KEY']
    client.api_username = ENV['DISCOURSE_API_USERNAME']
    client
  end

  def rows
    CSV.read(ENV['DISCOURSE_API_INPUT'], 'r').collect { |row| row.first }
  end

  def generate
    input = rows.clone.compact

    client.disposable_tokens(
      username: ENV['DISCOURSE_API_USERNAME'],
      quantity: input.count,
      group_names: ENV['DISCOURSE_API_GROUP_NAMES']
    ).collect do |token|
      "#{ENV['DISCOURSE_API_URL']}/invites/redeem/#{token}?email=#{input.shift}"
    end
  end
end
