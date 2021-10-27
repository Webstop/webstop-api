# WebstopApi

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/webstop-api`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'webstop-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install webstop-api

## Usage

The Webstop Api gem allows for interacting with the Webstop Api from a remote rails app as long as certain configuration options are present.  In order to use this gem properly, please do the following:

1.  Create an initializer file in your remote app.  An example would be `config/initializers/webstop.rb`
2.  Create a configuration block to initialize the gem like so:
```ruby
  WebstopApi.configure do |config|
    config.endpoint = "http://lvh.me:3000"
    config.retailer_id = 767
    config.api_version = "v3" # NOTE: Various methods over-ride this value so that endpoints in diff versions can be used simultaneously.
  end
```

You are now ready to use the gem.

### Information

To see a list of all of the available methods, take a look at the individual interfaces in the `interfaces` folder.

### Important methods

#### login

This client method allows an app to log a consumer in.  *NOTE* This is only applicable to the V3 api which is connected to consumer module 6.0.  If you are using login with a retailer on anything less
than that, use `legacy_login`

```ruby
  client = WebstopApi::Client.new
  @consumer = client.login(consumer_session: { email: "joe@bagels.com", password: "password", retailer_id: client.retailer_id })
  #@consumer is now a WebstopApi::Consumer, which has access to all of the data attributes of a consumer.
  @consumer.email #art@webstop.com
  @consumer.consumer_credential #use this value to make any calls to grab a consumer's data, such as coupons.
```

#### legacy_login

This is used to obtain an api_user token, essentially our old version of consumers.

```ruby
  client = WebstopApi::Client.new
  @consumer = client.legacy_login(type: "Card", retailer_id: client.retailer_id, login: "art@webstop.com", password: "aaa")
  #@consumer is now a WebstopApi::Consumer, which has access to all of the data attributes of a consumer.
  @consumer.email #art@webstop.com
  @consumer.api_user_credential #use this value to make any calls to grab a consumer's data, such as coupons.
```

## Development

### Non-Docker-based Dev
After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).  (But, we don't deploy like this and the gem should be disabled for such deployment.)

### Docker-based Dev

After checking out the repo, run `./setup` to install gem dependencies and configure everything to run.  To open a nice interactive console session, run `./console`.  

### Rubymine Integration

After doing the docker-based setup above:

1. Configure Docker Deployment Environment in RubyMine Settings

    1. Open RubyMine Settings and navigate to 'Build, Execution, Deployment' > 'Docker'
    2. If you don't already have a Docker configuration listed under the `+`/`-` buttons in the middle top then click the `+` button and select 'Docker for Mac' as the type.  Leave the rest of the defaults alone.
    3. Click 'OK'

   see: [https://www.jetbrains.com/help/ruby/docker.html](https://www.jetbrains.com/help/ruby/docker.html)

2. Setup Docker as a remote interpreter

    1. Open RubyMine Settings and navigate to 'Language & Frameworks' > 'Ruby SDK and Gems'
    2. Check to see if you already have defined a remote SDK for this project by looking in the list of SDKs for one that looks like `"Remote: ruby-2.5.5-p157 (docker-compose://[/Users/<path to your project>/docker-compose.yml])"`.  If it exists already then simply select it.  Otherwise, continue with the following steps.
    3. For the current project, click the `+` button and select `New remote...` from the drop-down menu
    4. Select `docker-compose` at the top and then select "web" for the 'service'
    5. Click 'OK'
    6. Make sure that your newly created remote interpreter is selected then click 'OK' to dismiss the Settings window

   Note that there may be a delay or some background processes that run for a minute synchronizing and indexing code and gems.


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/webstop-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
