require "webstop-api/rest/users"
module WebstopApi
  module Interfaces
    module Users
      include WebstopApi::REST::Consumers

      def me(token)
        _me(token)
      end
      
    end
  end
end
