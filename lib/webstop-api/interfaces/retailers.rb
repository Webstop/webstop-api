require "webstop-api/rest/retailers"
module WebstopApi
  module Interfaces
    module Retailers
      include WebstopApi::REST::Retailers

      def retailer
        _get_retailer["retailer"].with_indifferent_access
      end
    end
  end
end
