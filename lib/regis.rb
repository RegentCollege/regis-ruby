# Regis API
# shamelessly cloned from https://github.com/Yelp/yelp-ruby

require 'regis/version'
require 'regis/client'

module Regis
    def self.client
        @client ||= Regis::Client.new
    end
end