require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Stores
      include WebstopApi::REST::Resources

      def _get_stores(options = {})
        stores = retailer_connection.get do |req|
          req.url "stores", consumer_credentials: options[:token]
          req.headers["Content-Type"] = "application_json"
        end
        JSON.parse(stores.body).with_indifferent_access
      end
    end
  end
end
