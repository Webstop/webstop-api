require "webstop-api/rest/consumers"
module WebstopApi
  module Interfaces
    module Consumers
      include WebstopApi::REST::Consumers

      def me(token)
        _me(token)
      end

      def update_consumer(options = {}, attributes = {})
        response = _update_me(options, attributes)
      end

      def create_consumer(attributes = {}, current_user = false)
        user_credentials =  { token: current_user == true ? token : nil }
        response = _create_consumer(attributes, user_credentials)
        @token = response["consumer"]["consumer_credentials"] unless current_user
      end

      def token
        @token
      end
    end
  end
end
