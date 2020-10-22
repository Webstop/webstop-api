require "webstop-api/rest/retailers"
require "webstop-api/models/retailer"
module WebstopApi
  module Interfaces
    module Retailers
      include WebstopApi::REST::Retailers

      # eg: @core_api.retailer  <-- defaults to WebstopApi.retailer_id
      # eg: @core_api.retailer(57)
      # TODO: add authentication to this endpoint!!!
      def retailer(retailer_id = nil)
        retailer_id ||= WebstopApi.retailer_id
        retailer = _get_retailer(retailer_id)["retailer"].with_indifferent_access
        Retailer.new(retailer)
      end
    end
  end
end
