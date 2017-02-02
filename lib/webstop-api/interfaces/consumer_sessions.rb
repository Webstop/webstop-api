require "webstop-api/rest/consumer_sessions"
module WebstopApi
  module Interfaces
    module ConsumerSessions
      include WebstopApi::REST::ConsumerSessions

      def login(credentials)
        response    = _login(credentials)
        @webstop_id = response["consumer"]["id"]
        @token      = response["consumer"]["consumer_credentials"]
      end

      def logout
        if _logout(token: token)
          @token = nil
        end
      end

      private

      def token
        @token
      end

      def webstop_id
        @webstop_id
      end

    end
  end
end
