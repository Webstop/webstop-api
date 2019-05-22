require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module ApiUserSessions
      include WebstopApi::REST::Resources


      def _legacy_login(body = {})
        account = connection.post do |req|
          req.url 'login'
          req.headers['Content-Type'] = 'application/json'
          req.body = body.to_json
        end
        JSON.parse(account.body)
      end

      def _legacy_logout(options = {})
        response = connection.delete do |req|
          req.headers['Content-Type'] = 'application/json'
          req.url 'logout', api_user_credentials: options[:token]
        end
      end

      def connection
        Faraday.new("#{ WebstopApi.endpoint }/api/v1")
      end

    end
  end
end
