require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Consumers
      include WebstopApi::REST::Resources

      def _me(options = {})
        response = RestClient.get "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/consumers/me.json?consumer_credentials=#{options[:token]}"
        Consumer.new(JSON.parse(response.body)["consumer"])
      end

      def _update_me(options = {}, consumer_attributes = {})
        response = RestClient.put "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/consumers/#{options[:webstop_id]}.json?consumer_credentials=#{options[:token]}", consumer_attributes
        Consumer.new(JSON.parse(response.body)["consumer"])
      end

      def _create_consumer(consumer_attributes = {}, options = {})
        response = RestClient.post "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id}/consumers.json?consumer_credentials=#{options[:token]}", consumer_attributes
        Consumer.new(JSON.parse(response.body)["consumer"])
      end
    end
  end
end
