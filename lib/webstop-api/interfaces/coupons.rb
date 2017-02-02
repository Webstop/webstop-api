require "webstop-api/rest/coupons"
module WebstopApi
  module Interfaces
    module Coupons
      include WebstopApi::REST::Coupons

      def get_all_coupons
        _get_all_coupons(token: token)
      end

      def get_coupon(id)
        _get_coupon(id, token: token)
      end

      def get_targeted_coupons
        _get_targeted_coupons(token: token)
      end

    end
  end
end
