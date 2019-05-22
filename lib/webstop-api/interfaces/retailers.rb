require "webstop-api/rest/retailers"
require "webstop-api/models/retailer"
module WebstopApi
  module Interfaces
    module Retailers
      include WebstopApi::REST::Retailers

      def retailer
        retailer = _get_retailer["retailer"].with_indifferent_access
        Retailer.new(retailer)
      end
    end
  end
end
