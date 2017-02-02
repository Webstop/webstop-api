require 'webstop-api/rest/consumer_sessions'
require 'webstop-api/rest/consumers'
require 'webstop-api/rest/external_sources'

module WebstopApi

  module Api
    include WebstopApi::REST::ConsumerSessions
    include WebstopApi::REST::Consumers
    include WebstopApi::REST::ExternalSources
  end
end
