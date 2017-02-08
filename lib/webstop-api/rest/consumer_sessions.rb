require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module ConsumerSessions
      include WebstopApi::REST::Resources

      def _login(options = {})
        response = RestClient.post "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/login.json", options
        JSON.parse(response.body)
      end

      def _logout(options = {})
        response = RestClient.delete "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/logout.json?consumer_credentials=#{options[:token]}"
      end
    end
  end
end
