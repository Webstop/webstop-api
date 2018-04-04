require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module SubscriptionLists
      include WebstopApi::REST::Resources

      def _get_all_sub_lists(options = {})
        response = retailer_connection.get do |req|
          req.url "subscription_lists", consumer_credentials: options[:token]
          req.headers['Content-Type'] = "application/json"
        end
        JSON.parse(response.body) rescue { subscription_lists: [] }
      end


      def _subscribe_to_list(consumer_id, list_id, options = {})
        response = retailer_connection.post do |req|
          req.url "subscription_lists/#{list_id}/consumers/#{consumer_id}", consumer_credentials: options[:token]
          req.headers['Content-Type'] = "application/json"
        end
        JSON.parse(response.body)
      end

      def _unsubscribe_to_list(consumer_id, list_id, options = {})
        response = retailer_connection.delete do |req|
          req.url "subscription_lists/#{list_id}/consumers/#{consumer_id}", consumer_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(response.body)
      end

    end
  end
end
