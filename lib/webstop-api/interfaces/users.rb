require "webstop-api/rest/users"
module WebstopApi
  module Interfaces
    module Users
      include WebstopApi::REST::Users

      def get_user_by_credentials(token)
        _get_user_by_credentials(token)
      end
      
    end
  end
end
