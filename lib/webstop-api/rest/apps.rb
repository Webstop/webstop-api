require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Apps
      include WebstopApi::REST::Resources

      def _get_apps
        apps = retailer_connection.get do |req|
          req.url "apps"
          req.headers['Content-Type'] = "application/json"
        end
        JSON.parse(apps.body).with_indifferent_access
      end
    end
  end
end
