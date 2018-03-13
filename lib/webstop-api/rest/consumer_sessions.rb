require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module ConsumerSessions
      include WebstopApi::REST::Resources

      def _login(body = {})
        account = connection.post do |req|
          req.url 'login'
          req.headers['Content-Type'] = 'application/json'
          req.body = body.to_json
        end
        JSON.parse(account.body)
      end

      def _logout(options = {})
        response = connection.delete do |req|
          req.headers['Content-Type'] = 'application/json'
          req.url 'logout', consumer_credentials: options[:token]
        end
      end

      def connection
        Faraday.new("#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }")
      end
    end
  end
end
