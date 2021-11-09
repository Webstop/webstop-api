require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Consumers
      include WebstopApi::REST::Resources

      def _me(token)
        account = retailer_connection.get do |req|
          req.url "consumers/me", consumer_credentials: token
        end
        JSON.parse(account.body)
      end

      # eg:
      #   _get_consumer(id: 241940, token: 'ewTB_0plpuwZ-cjhVpJz')
      #   _get_consumer(email: 'fake@email.com', token: 'ewTB_0plpuwZ-cjhVpJz')
      #
      # Note that an :email value can be passed as :id or an id as :email - both
      # names are treated the same and can contain either value.
      def _get_consumer(options = {})
        response = v3_retailer_connection.get do |req|
          req.url "consumers/#{options[:id] || options[:email]}", consumer_credentials: options[:token]
        end
        if response.success?
          JSON.parse(response.body)
        else
          return nil if response.status == 404
          raise "#{response.status}: #{response.reason_phrase}"
        end
      end

      def _get_consumer_by_card_number(options = {})
        response = v3_retailer_connection.get do |req|
          req.url "consumers/by_card_number.json", card_number: options[:card_number], consumer_credentials: options[:token]
        end
        if response.success?
          JSON.parse(response.body)
        else
          return nil if response.status == 404
          raise "#{response.status}: #{response.reason_phrase}"
        end
      end

      def _update_me(options = {}, consumer_attributes = {})
        account = retailer_connection.put do |req|
          req.url "consumers/#{options[:webstop_id]}", consumer_credentials: options[:token]
          req.body = consumer_attributes.to_json
        end
        if account.status == 204
          true
        else
          JSON.parse(account.body)
        end
      end

      def _create_consumer(consumer_attributes = {}, options = {})
        response = retailer_connection.post do |req|
          req.url "consumers", consumer_credentials: options[:token]
          req.body = consumer_attributes.to_json
        end
        raise "#{response.status}: #{response.reason_phrase}" if response.status >= 400
        JSON.parse(response.body)
      end

    end
  end
end
