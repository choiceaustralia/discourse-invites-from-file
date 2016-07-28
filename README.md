# Discourse Invites From File
Import user details from a file and generate invite links for discourse

[![Build Status](https://travis-ci.org/choiceaustralia/discourse-invites-from-file.svg?branch=master)](https://travis-ci.org/choiceaustralia/discourse-invites-from-file)

The invite link format is like this:

`http://discourse.example.com/invites/redeem/TOKEN?username=USERNAME&email=EMAIL&name=NAME&topic=TOPICID`

Replace following fields:

* `discourse.example.com` with the URL of your Discourse instance.
* `TOKEN` the invite token generated via the discourse api (that is what this gem does for you).
* `EMAIL` with the email of user you want to invite
* `USERNAME` with the desired username of invited user
* `NAME` with the first name of invited user
* `TOPIC` with the id of the topic to direct the user to after joining

## Steps

Visit ```/admin/api``` on your discourse installation and generate yourself an API key.

`cp env.example .env`

Edit ```.env``` adding your Host address, API key, Username and the names of any groups or topics.

Install the needed gems

`bundle install`

Run the rake task:

`bundle exec rake invites:generate:csv`

or with enviroment variables (these aren't set in ``.env`)

`bundle exec rake invites:generate:csv DISCOURSE_API_GROUP_NAMES=security,support DISCOURSE_API_TOPIC_ID=123`

This outputs to a file `tmp/output.csv`
