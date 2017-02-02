require "webstop-api/rest/retailers"
module WebstopApi
  module Interfaces
    module Retailers
      include WebstopApi::REST::Retailers

      def retailer
        _get_retailer
      end
    end
  end
end
