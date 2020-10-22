require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Retailers
      include WebstopApi::REST::Resources

      def _get_retailer(retailer_id = nil)
        retailer = connection.get do |req|
          req.url "retailers/#{retailer_id}"
        end
        JSON.parse(retailer.body)
      end
    end
  end
end
