require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module ExternalIds
      include WebstopApi::REST::Resources

      def _all_external_ids(id, options = {})
        ids = retailer_connection.get do |req|
          req.url "consumers/#{id}/external_ids", consumer_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(ids.body) rescue { external_ids: [] }
      end

      def _add_external_id(consumer_id, program_id, external_id_data = {}, options = {})
        id = retailer_connection.post do |req|
          req.url "consumers/#{consumer_id}/external_ids.json", consumer_credentials: options[:token]
          req.header["Content-Type"] = "application/json"
          req.body = { external_id: external_id_data, external_consumer_program_id: program_id }.to_json
        end
        JSON.parse(id.body)
      end

    end
  end
end
