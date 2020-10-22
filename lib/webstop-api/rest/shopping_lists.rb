require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module ShoppingLists
      include WebstopApi::REST::Resources

      def _add_list(data, options = {})
        list = retailer_connection.post do |req|
          req.url "shopping_lists", consumer_credentials: options[:token]
          req.body = { shopping_list: data }.to_json
        end
        JSON.parse(list.body) rescue { shopping_list: {} }
      end

      def _destroy_list(id, options = {})
        response = retailer_connection.delete do |req|
          req.url "shopping_lists/#{id}", consumer_credentials: options[:token]
        end
        return true if response.code == 204
        response
      end

      def _get_all_lists(options = {})
        lists = retailer_connection.get do |req|
          req.url "shopping_lists", consumer_credentials: options[:token]
        end
        JSON.parse(lists.body) rescue { shopping_lists: [] }
      end

      def _get_current_list(options = {})
        list = retailer_connection.get do |req|
          req.url "shopping_lists/current_list", consumer_credentials: options[:token]
        end
        JSON.parse(list.body) rescue { shopping_list: nil }
      end

      def _get_list(id, options = {})
        lists = retailer_connection.get do |req|
          req.url "shopping_lists/#{id}", consumer_credentials: options[:token]
        end
        JSON.parse(lists.body) rescue { shopping_list: nil }
      end

      def _make_current_list(id, options = {})
        lists = retailer_connection.get do |req|
          req.url "shopping_lists/#{id}/make_current", consumer_credentials: options[:token]
        end
        JSON.parse(lists.body) rescue { shopping_list: nil }
      end

      def _update_list(id, data, options = {})
        list = retailer_connection.put do |req|
          req.url "shopping_lists/#{id}", consumer_credentials: options[:token]
          req.body = { shopping_list: data }.to_json
        end
        JSON.parse(list.body)
      end

      def _get_favorites(options = {})
        favorites = retailer_connection.get do |req|
          req.url "shopping_list_favorites", consumer_credentials: options[:token]
        end
        JSON.parse(favorites.body)
      end

      def _add_favorite_to_list(id, shopping_list_id, options = {})
        response = retailer_connection.post do |req|
          req.url "shopping_lists/#{shopping_list_id}/shopping_list_favorites/#{id}/create_shopping_list_item", consumer_credentials: options[:token]
        end
        JSON.parse(response.body)
      end

      def _destroy_favorite(id, options = {})
        response = retailer_connection.delete do |req|
          req.url "shopping_list_favorites/#{id}", consumer_credentials: options[:token]
        end
        return true if response.status == 204
        false
      end

    end
  end
end
