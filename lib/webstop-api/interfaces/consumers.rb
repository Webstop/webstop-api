require "webstop-api/rest/consumers"
module WebstopApi
  module Interfaces
    module Consumers
      include WebstopApi::REST::Consumers

      def me(token)
        _me(token)
      end

      # eg:
      #   @core_api = WebstopApi::Client.new
      #   admin_consumer = @core_api.login(
      #     email: ENV['WEBSTOP_API_AUTH_LOGIN'],
      #     password: ENV['WEBSTOP_V3_API_AUTH_PASSWORD']
      #   )
      #   consumer = @core_api.get_consumer('test1@danlynn.org', admin_consumer.consumer_credentials)
      #   consumer2 = @core_api.get_consumer(241940, admin_consumer.consumer_credentials)
      def get_consumer(id_or_email, api_token)
        response = _get_consumer(id: id_or_email, token: api_token)
        return nil if response.nil?
        if response['errors']
          raise response['errors'].join('; ')
        else
          consumer = Consumer.new(response['consumer'])
          consumer.card_number = response['consumer']['legacy_card_number']
          consumer
        end
      end

      def get_consumer_by_card_number(card_number, api_token)
        response = _get_consumer_by_card_number(card_number: card_number, token: api_token)
        return nil if response.nil?
        if response['errors']
          raise response['errors'].join('; ')
        else
          consumer = Consumer.new(response['consumer'])
          consumer.card_number = response['consumer']['legacy_card_number']
          consumer
        end
      end

      def update_consumer(options = {}, attributes = {})
        response = _update_me(options, attributes)
      end

      def create_consumer(attributes = {}, current_user = false)
        user_credentials = { token: current_user == true ? token : nil }
        response = _create_consumer(attributes, user_credentials)
        @token = response["consumer"]["consumer_credentials"] unless current_user
      end

      def token
        @token
      end
    end
  end
end
