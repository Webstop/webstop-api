require 'webstop-api/rest/consumer_sessions'
require 'webstop-api/rest/consumers'
require 'webstop-api/rest/external_programs'
require 'webstop-api/rest/coupons'
require 'webstop-api/rest/shopping_lists'

module WebstopApi

  module Api
    include WebstopApi::REST::ConsumerSessions
    include WebstopApi::REST::Consumers
    include WebstopApi::REST::Coupons
    include WebstopApi::REST::ExternalPrograms
    include WebstopApi::REST::ShoppingLists
  end
end
