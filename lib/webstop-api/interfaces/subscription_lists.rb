require 'webstop-api/rest/resources'
module WebstopApi
  module Interfaces
    module SubscriptionLists
      include WebstopApi::REST::SubscriptionLists

      def get_all_sub_lists(options = {})
        _get_all_sub_lists(token: token)
      end


      def subscribe_to_list(consumer_id, id, options = {})
        _subscribe_to_list(consumer_id, id, token: token)
      end

      def unsubscribe_to_list(consumer_id, id, options = {})
        _unsubscribe_to_list(consumer_id, id, token: token)
      end
    end
  end
end
