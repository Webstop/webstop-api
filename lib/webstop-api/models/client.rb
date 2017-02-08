require 'webstop-api/api'
require 'resolv-replace'
require "webstop-api/interfaces/consumers"
require "webstop-api/interfaces/consumer_sessions"
require "webstop-api/interfaces/external_programs"
require "webstop-api/interfaces/retailers"
require "webstop-api/interfaces/coupons"
require "webstop-api/interfaces/shopping_lists"

module WebstopApi
  class Client
    include WebstopApi::Interfaces::Consumers
    include WebstopApi::Interfaces::ConsumerSessions
    include WebstopApi::Interfaces::ExternalPrograms
    include WebstopApi::Interfaces::Retailers
    include WebstopApi::Interfaces::Coupons
    include WebstopApi::Interfaces::ShoppingLists
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options={})
      merged_options = WebstopApi.options.merge(options)

      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end

  end
end
