require "webstop-api/rest/stores"
module WebstopApi
  module Interfaces
    module Stores
      include WebstopApi::REST::Stores

      # eg: @core_api.get_stores(@legacy_credentials.api_user_credentials)
      def get_stores(token)
        _get_stores(token: token).with_indifferent_access
      end

      def find_store_by_store_number(store_number)
        _get_store(store_number: store_number)
      end

      def create_store(options = {}, attributes = {})
        _create_store(options, attributes)
      end

      def update_store(options = {}, attributes = {})
        _update_store(options, attributes)
      end
    end
  end
end
