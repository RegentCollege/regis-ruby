# REGIS

Used to access a REGIS api

## Installation

Add this line to your application's Gemfile:

    gem 'regis'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install regis

Responses are cached with Dalli which requires memcached

    $ apt-get install memcached

## Configuration

Set config/regis_api.yml

```
require 'regis'

$REGIS_API = YAML.load_file("config/regis_api.yml")

Regis.client.configure do |config|
  config.url = $REGIS_API['url']
  config.username = $REGIS_API['username']
  config.password = $REGIS_API['password']
  config.cache = Regis::Cache.new(Dalli::Client.new('localhost:11211', { :namespace => "regis", :compress => true, :expires_in => 3600 }))
end
```

## Usage

See features/step_definitions/api_steps

## Caching

All responses are cached based on the request URL. So, all endpoints must include variables in the URL itself.

## Testing

Set features/config/test_values.yml

    $ cucumber