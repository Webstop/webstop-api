require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Tracking
      include WebstopApi::REST::Resources

      def _track(options = {})
        body = { event: options[:event], properties: options[:properties] }
        if options[:card_number]
          response = tracking_connection.post do |req|
            req.url "cards/#{options[:card_number]}/tracking/track.json"
            req.headers['Content-Type'] = 'application/json'
            req.body = body.to_json
          end
        else
          response = tracking_connection.post do |req|
            req.url "tracking/track.json"
            req.headers['Content-Type'] = 'application/json'
            req.body = body.to_json
          end
        end
        response.status
      end

      def tracking_connection
        Faraday.new("#{ WebstopApi.endpoint }/api/v1/retailers/#{WebstopApi.retailer_id}")
      end

    end
  end
end
