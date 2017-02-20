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
    config.api_version = "v3" #NOTE: This gem will only function properly with V3 of the Webstop API.
  end
```

You are now ready to use the gem.

### Examples

```ruby
  client = WebstopApi.new
  client.login(consumer_session: { email: "joe@bagels.com", password: "password", retailer_id: client.retailer_id })
  #Your client will now have an authenticated session with the retailer api
  client.get_all_coupons #returns a JSON body of coupons
```
To see a list of all of the available methods, take a look at the individual interfaces in the `interfaces` folder.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/webstop-api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
