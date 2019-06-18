require "webstop-api/rest/users"
require "webstop-api/models/user"
module WebstopApi
  module Interfaces
    module Users
      include WebstopApi::REST::Users

      def get_user_by_credentials(token)
        response = _get_user_by_credentials(token)
        user = response['user'].with_indifferent_access
        User.new(user)
      end
      
    end
  end
end
