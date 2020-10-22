require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Cards
      include WebstopApi::REST::Resources

      def _card(options = {})
        account = retailer_connection.get do |req|
          req.url "consumers/#{options[:card_number]}", api_user_credentials: options[:token]
        end
        JSON.parse(account.body)
      end

    end
  end
end
