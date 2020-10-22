require 'webstop-api/rest/resources'
require 'webstop-api/models/external_program'
module WebstopApi
  module REST
    module ExternalPrograms
      include WebstopApi::REST::Resources

      def _all_external_programs
        programs = retailer_connection.get do |req|
          req.url "external_consumer_programs", consumer_credentials: options[:token]
        end
        JSON.parse(programs.body) rescue { external_ids: [] }
      end

    end
  end
end
