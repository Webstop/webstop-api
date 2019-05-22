require "webstop-api/rest/consumer_sessions"
require "webstop-api/models/consumer"

module WebstopApi
  module Interfaces
    module ConsumerSessions
      include WebstopApi::REST::ConsumerSessions

      def login(credentials)
        response    = _login(credentials.merge(retailer_id: WebstopApi.retailer_id))
        webstop_id = response.dig("consumer", "id")
        token      = response.dig("consumer", "consumer_credentials")
        errors     = response.dig("errors")
        @token = token
        Consumer.new(response[:consumer])
      end

      def logout
        if _logout(token: token)
          true
        end
      end

    end
  end
end
