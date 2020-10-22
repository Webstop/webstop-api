require "webstop-api/rest/api_user_sessions"
require "webstop-api/models/api_user"

module WebstopApi
  module Interfaces
    module ApiUserSessions
      include WebstopApi::REST::ApiUserSessions

      # eg:
      #   @api_user = @core_api.legacy_login(
      #     retailer_id: 767,
      #     type: 'Card',
      #     login: 'greg+tops-api-user@webstop.com',
      #     password: '******'
      #   )
      def legacy_login(credentials)
        result = _legacy_login(credentials)
        ApiUser.new(result)
      end

      def legacy_logout
        if _legacy_logout(token: token)
          true
        end
      end

    end
  end
end
