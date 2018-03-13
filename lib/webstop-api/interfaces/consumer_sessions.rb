require "webstop-api/rest/consumer_sessions"

module WebstopApi
  module Interfaces
    module ConsumerSessions
      include WebstopApi::REST::ConsumerSessions

      def login(credentials)
        response    = _login(credentials.merge(retailer_id: WebstopApi.retailer_id))
        webstop_id = response.dig("consumer", "id")
        token      = response.dig("consumer", "consumer_credentials")
        errors     = response.dig("errors")
        ConsumerSession.new(webstop_id: webstop_id, token: token, errors: errors)
      end

      def logout
        if _logout(token: token)
          @token = nil
        end
      end

    end
  end
end
