require "webstop-api/rest/apps"

module WebstopApi
  module Interfaces
    module Apps
      include WebstopApi::REST::Apps

      def get_apps
        _get_apps["retailer_app_assignments"]
      end

    end
  end
end
