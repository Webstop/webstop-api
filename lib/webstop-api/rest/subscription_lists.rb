require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module SubscriptionLists
      include WebstopApi::REST::Resources

      def _get_all_sub_lists(options = {})
        response = RestClient.get "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/subscription_lists.json?consumer_credentials=#{options[:token]}"
        JSON.parse(response) rescue { subscription_lists: [] }
      end


      def _subscribe_to_list(consumer_id, list_id, options = {})
        response = RestClient.post "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/subscription_lists/#{list_id}/consumers/#{consumer_id}.json?consumer_credentials=#{options[:token]}", {}
        JSON.parse(response.body)
      end

      def _unsubscribe_to_list(consumer_id, list_id, options = {})
        response = RestClient.delete "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/subscription_lists/#{list_id}/consumers/#{consumer_id}.json?consumer_credentials=#{options[:token]}", {}
        JSON.parse(response.body)
      end

    end
  end
end
