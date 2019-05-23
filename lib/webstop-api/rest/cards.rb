require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Cards
      include WebstopApi::REST::Resources

      def _card(options = {})
        account = retailer_connection.get do |req|
          req.url "consumers/#{options[:card_number]}", api_user_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(account.body)
      end

      def card_connection
        Faraday.new("#{ WebstopApi.endpoint }/api/v1/retailers/#{WebstopApi.retailer_id}")
      end
    end
  end
end
