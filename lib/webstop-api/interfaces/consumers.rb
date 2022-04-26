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
          parse_consumer(response['consumer'])
        end
      end

      def get_consumer_by_card_number(card_number, api_token)
        response = _get_consumer_by_card_number(card_number: card_number, token: api_token)
        return nil if response.nil?
        if response['errors']
          raise response['errors'].join('; ')
        else
          parse_consumer(response['consumer'])
        end
      end

      def get_consumers_by_card_numbers(card_numbers, api_token)
        response = _get_consumer_by_card_number(card_numbers: card_numbers, token: api_token)
        return nil if response.nil?
        if response['errors']
          raise response['errors'].join('; ')
        else
          consumers = response['consumers'].collect do |consumer|
            parse_consumer(consumer)
          end
        end
      end

      def update_consumer(options = {}, attributes = {})
        response = _update_me(options, attributes)
        if response['error']
          raise response['error']
        elsif response['consumer']
          parse_consumer(response['consumer'])
        else
          raise "Could not parse consumer from api response: #{response.inspect}"
        end
      end

      # Create new consumer.  If 'current_user' is Boolean then do something
      # weird and use @token attribute for credentials.  Otherwise, if a String
      # is passed in 'current_user' then use that string as the credentials.
      #
      # @param attributes [Hash] hash of consumer attributes
      # @param current_user [Boolean|String] either pass credentials or true if
      #                   credentials should be retrieved from @token attribute
      def create_consumer(attributes = {}, current_user = false)
        if [true, false].include?(current_user) # check if boolean
          user_credentials = { token: current_user == true ? token : nil }
          response = _create_consumer(attributes, user_credentials)
          @token = response["consumer"]["consumer_credentials"] unless current_user
        else # else assume 'current_user' is the credentials token string
          response = _create_consumer(attributes, token: current_user)
          if response['error']
            raise response['error']
          elsif response['consumer']
            parse_consumer(response['consumer'])
          else
            raise "Could not parse consumer from api response: #{response.inspect}"
          end
        end
      end

      def token
        @token
      end

      private

      # Parse consumer hash into new Consumer instance.  The consumer.primary_card_number
      # is parsed from the external_ids.  The consumer.card_number is assigned from
      # the primary_card_number if it exists - else defaults to legacy_card_number.
      #
      # @param consumer_hash [Hash] attributes parsed from JSON for consumer (no root "consumer" node)
      def parse_consumer(consumer_hash)
        consumer = Consumer.new(consumer_hash)
        consumer.primary_card_number = consumer_hash["external_ids"].find{|external_id| external_id["primary_of_source"]}["card_number"] rescue nil
        consumer.card_number = consumer.primary_card_number || consumer.legacy_card_number
        consumer
      end

    end
  end
end
