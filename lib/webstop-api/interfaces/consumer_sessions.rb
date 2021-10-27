require "webstop-api/rest/consumer_sessions"
require "webstop-api/models/consumer"

module WebstopApi
  module Interfaces
    module ConsumerSessions
      include WebstopApi::REST::ConsumerSessions

      # eg:
      #   @core_api = WebstopApi::Client.new
      #   @consumer = @core_api.login(
      #     consumer_session: {
      #       email: ENV['WEBSTOP_API_AUTH_LOGIN'],
      #       password: ENV['WEBSTOP_API_AUTH_PASSWORD'],
      #       retailer_id: 767
      #     }
      #   )
      #   -or-
      #   @consumer = @core_api.login(
      #     email: ENV['WEBSTOP_API_AUTH_LOGIN'],
      #     password: ENV['WEBSTOP_API_AUTH_PASSWORD']
      #   )
      #
      # Note that the `retailer_id` is optional and will default to
      # WebstopApi.retailer_id if not provided.
      def login(credentials)
        unless credentials[:consumer_session] # wrap in :consumer_session if not already
          credentials = {consumer_session: credentials}
        end
        credentials[:consumer_session][:retailer_id] ||= WebstopApi.retailer_id # default retailer_id
        response = _login(credentials)
        error = response.dig("error")
        if error
          raise error
        else
          @token = response['consumer']['consumer_credentials']
          Consumer.new(response['consumer'])
        end
      end

      def logout
        if _logout(token: token)
          true
        end
      end

    end
  end
end
