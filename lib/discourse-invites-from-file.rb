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
    client.disposable_tokens
  end
end
