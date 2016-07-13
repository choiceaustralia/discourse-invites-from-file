require 'dotenv'
require 'discourse-invites-from-file'

Dotenv.load

namespace :invites do
  task :generate do
    puts DiscourseInvitesFromFile.new.generate
  end
end
