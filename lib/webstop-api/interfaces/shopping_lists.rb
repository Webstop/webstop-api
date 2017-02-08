require 'webstop-api/rest/resources'
module WebstopApi
  module Interfaces
    module ShoppingLists
      include WebstopApi::REST::ShoppingLists

      def add_list(data)
        _add_list(data, token: token)
      end

      def destroy_list(id)
        _destroy_list(id, token: token)
      end
      
      def get_all_lists
        _get_all_lists(token: token)
      end

      def get_current_list
        _get_current_list(token: token)
      end

      def get_list(id)
        _get_list(id, token: token)
      end

      def make_current_list(id)
        _make_current_list(id, token: token)
      end

      def update_list(id, data)
        _update_list(id, data, token: token)
      end

    end
  end
end
