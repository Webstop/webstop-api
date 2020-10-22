require "webstop-api/rest/stores"
module WebstopApi
  module Interfaces
    module Stores
      include WebstopApi::REST::Stores

      # eg: @core_api.get_stores(@legacy_credentials.api_user_credentials)
      def get_stores(token)
        _get_stores(token: token).with_indifferent_access
      end
    end
  end
end
