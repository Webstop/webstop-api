require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module ExternalIds
      include WebstopApi::REST::Resources

      def _all_external_ids(id, options = {})
        response = RestClient.get "#{WebstopApi.endpoint}/api/#{WebstopApi.api_version}/retailers/#{WebstopApi.retailer_id}/consumers/#{id}/external_ids.json?consumer_credentials=#{options[:token]}"
        JSON.parse(response)
      end

      def _add_external_id(consumer_id, program_id, external_id_data = {}, options = {})
        response = RestClient.post "#{WebstopApi.endpoint}/api/#{WebstopApi.api_version}/retailers/#{WebstopApi.retailer_id}/consumers/#{consumer_id}/external_ids.json?consumer_credentials=#{options[:token]}", { external_id: external_id_data, external_consumer_program_id: program_id }
        JSON.parse(response)
      end

    end
  end
end
