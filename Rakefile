require 'dotenv'
require 'discourse-invites-from-file'

Dotenv.load

namespace :invites do
  task :dump do
    puts DiscourseInvitesFromFile.new.client.inspect
  end

  desc 'Generate invites from a CSV file to Standard Out'
  task :generate do
    puts DiscourseInvitesFromFile.new.generate
  end

  desc 'Generate invites from a CSV file to a tmp/output.csv'
  task 'generate:csv' do
    links = DiscourseInvitesFromFile.new.generate
    File.open(ENV['DISCOURSE_API_OUTPUT'], 'w') { |f| f.write links.join("\n") }
  end
end
