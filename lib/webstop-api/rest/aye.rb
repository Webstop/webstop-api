require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Aye
      include WebstopApi::REST::Resources

      def _track(options = {})
        body = { name: options[:name], properties: options[:properties] }

        if options[:consumer_id]
          response = v1_retailer_connection.post do |req|
            req.url "consumers/#{options[:consumer_id]}/aye/event"
            req.body = body.to_json
          end
        elsif options[:card_number]
          response = v1_retailer_connection.post do |req|
            req.url "cards/#{options[:card_number]}/aye/event"
            req.body = body.to_json
          end
        else
          response = v1_retailer_connection.post do |req|
            req.url "aye/event"
            req.body = body.to_json
          end
        end
        response.status
      end

    end
  end
end
