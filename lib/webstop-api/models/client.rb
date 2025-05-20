require 'webstop-api/api'
require 'resolv-replace'
require "webstop-api/interfaces/apps"
require "webstop-api/interfaces/api_user_sessions"
require "webstop-api/interfaces/cards"
require "webstop-api/interfaces/consumers"
require "webstop-api/interfaces/users"
require "webstop-api/interfaces/consumer_sessions"
require "webstop-api/interfaces/external_programs"
require "webstop-api/interfaces/external_ids"
require "webstop-api/interfaces/retailers"
require "webstop-api/interfaces/coupons"
require "webstop-api/interfaces/programs"
require "webstop-api/interfaces/shopping_lists"
require "webstop-api/interfaces/stores"
require "webstop-api/interfaces/subscription_lists"
require "webstop-api/interfaces/aye"

module WebstopApi
  class Client
    include WebstopApi::Interfaces::Apps
    include WebstopApi::Interfaces::ApiUserSessions
    include WebstopApi::Interfaces::Cards
    include WebstopApi::Interfaces::Consumers
    include WebstopApi::Interfaces::Users
    include WebstopApi::Interfaces::ConsumerSessions
    include WebstopApi::Interfaces::Coupons
    include WebstopApi::Interfaces::ExternalPrograms
    include WebstopApi::Interfaces::ExternalIds
    include WebstopApi::Interfaces::Programs
    include WebstopApi::Interfaces::Retailers
    include WebstopApi::Interfaces::ShoppingLists
    include WebstopApi::Interfaces::Stores
    include WebstopApi::Interfaces::SubscriptionLists
    include WebstopApi::Interfaces::Aye
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options={})
      merged_options = WebstopApi.options.merge(options)

      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end

    
    # get reference to core_api instance (using ENV config)
    def self.v3_core_api
      @@v3_core_api ||= WebstopApi::Client.new(api_version: "v3")
    end
    
    
    def self.v3_core_credentials
      @@v3_core_credentials ||= begin
        admin = v3_core_api.login(
          retailer_id: ENV['RETAILER_ID'],
          email: ENV['WEBSTOP_API_V3_AUTH_LOGIN'],
          password: ENV['WEBSTOP_API_V3_AUTH_PASSWORD']
        )
        admin.consumer_credentials
      end
    end
  end
end
