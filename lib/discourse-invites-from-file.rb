require 'discourse_api'

class DiscourseInvitesFromFile
  def client
    DiscourseApi::Client.new('http://')
  end
end
