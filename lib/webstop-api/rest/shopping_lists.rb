require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module ShoppingLists
      include WebstopApi::REST::Resources

      def _add_list(data, options = {})
        response = RestClient.post "#{WebstopApi.endpoint }/api/#{WebstopApi.api_version}/retailers/#{WebstopApi.retailer_id}/shopping_lists.json?consumer_credentials=#{options[:token]}", shopping_list: data
        JSON.parse(response)
      end

      def _destroy_list(id, options = {})
        response = RestClient.delete "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/shopping_lists/#{id}.json?consumer_credentials=#{options[:token]}"
        return true if response.code == 204
        response
      end

      def _get_all_lists(options = {})
        response = RestClient.get "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/shopping_lists.json?consumer_credentials=#{options[:token]}"
        JSON.parse(response) rescue { shopping_lists: [] }
      end

      def _get_current_list(options = {})
        response = RestClient.get "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/shopping_lists/current_list.json?consumer_credentials=#{options[:token]}"
        JSON.parse(response)
      end

      def _get_list(id, options = {})
        response = RestClient.get "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/shopping_lists/#{id}.json?consumer_credentials=#{options[:token]}"
        JSON.parse(response)
      end

      def _make_current_list(id, options = {})
        response = RestClient.get "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/shopping_lists/#{id}/make_current.json?consumer_credentials=#{options[:token]}"
        JSON.parse(response)
      end

      def _update_list(id, data, options = {})
        response = RestClient.put "#{WebstopApi.endpoint}/api/#{WebstopApi.api_version}/retailers/#{WebstopApi.retailer_id}/shopping_lists/#{id}.json?consumer_credentials=#{options[:token]}", shopping_list: data
        JSON.parse(response)
      end

      def _get_favorites(options = {})
        response = RestClient.get "#{WebstopApi.endpoint}/api/#{WebstopApi.api_version}/retailers/#{WebstopApi.retailer_id}/shopping_list_favorites.json?consumer_credentials=#{options[:token]}"
        JSON.parse(response)
      end

      def _add_favorite_to_list(id, shopping_list_id, options = {})
        response = RestClient.post "#{WebstopApi.endpoint}/api/#{WebstopApi.api_version}/retailers/#{WebstopApi.retailer_id}/shopping_lists/#{shopping_list_id}/shopping_list_favorites/#{id}/create_shopping_list_item.json?consumer_credentials=#{options[:token]}", {}
        JSON.parse(response)
      end

      def _destroy_favorite(id, options = {})
        response = RestClient.delete "#{WebstopApi.endpoint}/api/#{WebstopApi.api_version}/retailers/#{WebstopApi.retailer_id}/shopping_list_favorites/#{id}.json?consumer_credentials=#{options[:token]}", {}
      end

    end
  end
end
