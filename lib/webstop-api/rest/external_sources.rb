require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module ExternalSources
      include WebstopApi::REST::Resources

      def _all_external_sources
        response = RestClient.get "#{WebstopApi.endpoint}/api/#{WebstopApi.api_version}/retailers/#{WebstopApi.retailer_id}/external_sources.json"
        JSON.parse(response)["external_sources"].map{ |es| ExternalSource.new(es) }
      end

    end
  end
end
