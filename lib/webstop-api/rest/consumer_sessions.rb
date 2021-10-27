require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module ConsumerSessions
      include WebstopApi::REST::Resources

      def _login(body = {})
        account = v3_connection.post do |req|
          req.url 'login'
          req.body = body.to_json
        end
        JSON.parse(account.body)
      end

      def _logout(options = {})
        response = v3_connection.delete do |req|
          req.url 'logout', consumer_credentials: options[:token]
        end
      end

    end
  end
end
