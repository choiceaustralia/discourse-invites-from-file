# Discourse Invites From File
Import user details from a file and generate invite links for discourse

[![Build Status](https://travis-ci.org/choiceaustralia/discourse-invites-from-file.svg?branch=master)](https://travis-ci.org/choiceaustralia/discourse-invites-from-file)

The link format is like this:

`http://discourse.example.com/invites/redeem/TOKEN?username=USERNAME&email=EMAIL&name=NAME&topic=TOPICID`

Replace following fields:

*discourse.example.com with the URL of your Discourse instance.
*TOKEN with one of the 200 Invite tokens you just generated.
*EMAIL with the email of user you want to invite
USERNAME with the desired username of invited user
NAME with the first name of invited user
TOPIC with the id of the topic to direct the user to after joining

## Steps

Visit ```/admin/api``` on your discourse installation and generate yourself an API key.

`cp env.example .env`

Edit ```.env``` adding your Host address, API key, Username and the names of any groups
