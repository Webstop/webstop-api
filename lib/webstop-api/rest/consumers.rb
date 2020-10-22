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
        account = retailer_connection.post do |req|
          req.url "consumers", consumer_credentials: options[:token]
          req.body = consumer_attributes.to_json
        end
        JSON.parse(account.body)
      end

    end
  end
end
