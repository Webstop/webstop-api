require 'webstop-api/rest/resources'
require 'webstop-api/models/external_program'
module WebstopApi
  module REST
    module ExternalPrograms
      include WebstopApi::REST::Resources

      def _all_external_programs
        response = RestClient.get "#{WebstopApi.endpoint}/api/#{WebstopApi.api_version}/retailers/#{WebstopApi.retailer_id}/external_consumer_programs.json"
        JSON.parse(response)
      end

    end
  end
end
