require 'discourse_api'
require 'csv'

class DiscourseInvitesFromFile
  def client
    DiscourseApi::Client.new(ENV['DISCOURSE_API_URL'])
  end

  def rows
    CSV.read(ENV['DISCOURSE_API_INPUT'], 'r').collect { |row| row.first }
  end

  def generate
    input = rows.clone
    client.disposable_tokens(username: ENV['DISCOURSE_API_USERNAME'], quantity: input.count).collect do |token|
      "#{ENV['DISCOURSE_API_URL']}/invites/redeem/#{token}?email=#{input.shift}"
    end
  end
end
