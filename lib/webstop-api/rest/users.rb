require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Users
      include WebstopApi::REST::Resources

      def _me(token)
        account = retailer_connection.get do |req|
          req.url "users/me", user_credentials: token
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(account.body)
      end

    end
  end
end
