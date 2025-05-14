require 'webstop-api/rest/api_user_sessions'
require 'webstop-api/rest/consumer_sessions'
require 'webstop-api/rest/consumers'
require 'webstop-api/rest/users'
require 'webstop-api/rest/external_programs'
require 'webstop-api/rest/coupons'
require 'webstop-api/rest/shopping_lists'
require 'webstop-api/rest/stores'
require 'webstop-api/rest/subscription_lists'


module WebstopApi

  module Api
    include WebstopApi::REST::ApiUserSessions
    include WebstopApi::REST::ConsumerSessions
    include WebstopApi::REST::Consumers
    include WebstopApi::REST::Users
    include WebstopApi::REST::Coupons
    include WebstopApi::REST::ExternalPrograms
    include WebstopApi::REST::ShoppingLists
    include WebstopApi::REST::Stores
    include WebstopApi::REST::SubscriptionLists
  end
end
