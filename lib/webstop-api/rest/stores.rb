require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Stores
      include WebstopApi::REST::Resources

      def _get_stores(options = {})
        stores = retailer_connection.get do |req|
          req.url "stores", consumer_credentials: options[:token]
        end
        JSON.parse(stores.body).with_indifferent_access
      end

      def _get_store(options = {})
        retailer_connection.get do |req|
          req.url "stores/by_store_number/#{options[:store_number]}", consumer_credentials: options[:token]
        end
      end

      def _create_store(options = {}, store_attributes = {})
        retailer_connection.post do |req|
          req.url "stores/", consumer_credentials: options[:token]
          req.body = store_attributes.compact.to_json
        end
      end

      def _update_store(options = {}, store_attributes = {})
        retailer_connection.put do |req|
          req.url "stores/#{options[:store_id]}", consumer_credentials: options[:token]
          req.body = store_attributes.compact.to_json
        end
      end
    end
  end
end
