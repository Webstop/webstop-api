require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Aye
      include WebstopApi::REST::Resources

      def _track(options = {})
        body = { name: options[:name], properties: options[:properties] }

        if options[:consumer_id]
          response = aye_connection.post do |req|
            req.url "consumers/#{options[:consumer_id]}/aye/event"
            #req.headers['Content-Type'] = 'application/json'
            req.body = body
          end
        elsif options[:card_number]
          response = aye_connection.post do |req|
            req.url "cards/#{options[:card_number]}/aye/event"
            #req.headers['Content-Type'] = 'application/json'
            req.body = body
          end
        else
          response = aye_connection.post do |req|
            req.url "aye/event"
            #req.headers['Content-Type'] = 'application/json'
            req.body = body
          end
        end
        response.status
      end

      def aye_connection
        Faraday.new("#{ WebstopApi.endpoint }/api/v1/retailers/#{WebstopApi.retailer_id}")
      end

    end
  end
end
