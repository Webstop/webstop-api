require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module ApiUserSessions
      include WebstopApi::REST::Resources


      def _legacy_login(body = {})
        account = v1_connection.post do |req|
          req.url 'login'
          req.body = body.to_json
        end
        JSON.parse(account.body)
      end

      def _legacy_logout(options = {})
        response = v1_connection.delete do |req|
          req.url 'logout', api_user_credentials: options[:token]
        end
      end

    end
  end
end
