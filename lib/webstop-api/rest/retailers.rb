require 'webstop-api/rest/retailers'
module WebstopApi
  module REST
    module Retailers
      include WebstopApi::REST::Resources

      def _get_retailer
        retailer = retailer_connection.get do |req|
          req.headers["Content-Type"] = "application_json"
        end
        JSON.parse(retailer.body)
      end
    end
  end
end
