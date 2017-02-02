require 'webstop-api/rest/retailers'
module WebstopApi
  module REST
    module Retailers
      include WebstopApi::REST::Resources

      def _get_retailer
        response = RestClient.get "#{WebstopApi.endpoint}/api/#{WebstopApi.api_version}/retailers/#{WebstopApi.retailer_id}.json"
        JSON.parse(response)
      end
    end
  end
end
