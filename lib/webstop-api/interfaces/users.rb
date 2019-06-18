require "webstop-api/rest/users"
require "webstop-api/models/user"
module WebstopApi
  module Interfaces
    module Users
      include WebstopApi::REST::Users

      def get_user_by_credentials(token)
        user = _get_user_by_credentials(token).with_indifferent_access
        User.new(user)
      end
      
    end
  end
end
