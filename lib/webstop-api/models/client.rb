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
require "webstop-api/interfaces/tracking"

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
    include WebstopApi::Interfaces::Tracking
    attr_accessor *Configuration::VALID_CONFIG_KEYS

    def initialize(options={})
      merged_options = WebstopApi.options.merge(options)

      Configuration::VALID_CONFIG_KEYS.each do |key|
        send("#{key}=", merged_options[key])
      end
    end
  end
end
