require "webstop-api/rest/coupons"
module WebstopApi
  module Interfaces
    module Coupons
      include WebstopApi::REST::Coupons

      # eg: @core_api.get_all_coupons(@legacy_credentials.api_user_credentials, "0000000198")
      # eg: @core_api.get_all_coupons(@legacy_credentials.api_user_credentials)
      def get_all_coupons(token, card_number = nil)
        _get_all_coupons(token: token, card_number: card_number).with_indifferent_access["coupons"]
      end

      def get_clipped_coupons(token)
        _get_clipped_coupons(token: token).with_indifferent_access[:coupons]
      end

      # Example query values (passed as Hash):
      #   Find currently live offers containing "eggs" in the description:
      #     {
      #       text: "eggs",
      #       scopes: ["from_inmar", "future_display_end_date"]
      #     }
      #   Find currently live offers containing "eggs" in the description:
      #     {
      #       text: "Save $5.00",
      #       scopes: ["from_inmar", "future_display_end_date"]
      #     }
      #   Find current and future welcome offers for erie program:
      #     {
      #       tag: "enroll-erie"
      #       scopes: ["from_inmar", "approved_offers"]
      #     }
      #   Find specific offers by inmar offer id (mdid):
      #     {
      #       source_coupon_ids: [12345, 12346, 12347]
      #       scopes: ["from_inmar"]
      #     }
      #   Find specific offers by webstop offer id:
      #     {
      #       ids: [22225, 22226]
      #     }
      #
      # Example calls:
      #   @core_api.search_coupons({ids: [374, 71]}, @legacy_credentials.api_user_credentials)
      #   @core_api.search_coupons({source_coupon_ids: [2849132, 118803]}, @legacy_credentials.api_user_credentials)
      #   @core_api.search_coupons({scopes: ["from_inmar", "live"], text: "$5.00"}, @legacy_credentials.api_user_credentials)
      def search_coupons(query, token)
        _search_coupons(query, token: token).with_indifferent_access[:coupons]
      end

      def get_coupon(id, token)
        _get_coupon(id, token: token).with_indifferent_access[:coupon]
      end

      # eg: @core_api.get_coupons_by_tag("0000000198", 'erie', @legacy_credentials.api_user_credentials)
      # eg: @core_api.get_coupons_by_tag(nil, 'erie', nil)
      def get_coupons_by_tag(card_number, tag, token = nil)
        _get_coupons_by_tag(card_number: card_number, tag: tag, token: token)
      end

      def get_targeted_coupons(token)
        _get_targeted_coupons(token: token).with_indifferent_access["coupons"]
      end

      def clip_coupon(id, token, card_number = nil)
        if api_version == "v3"
          _clip_coupon(id: id, token: token).with_indifferent_access
        else
          _legacy_clip_coupon(id: id, token: token, card_number: card_number).with_indifferent_access
        end
      end

      def clip_coupon_by_tag(card_number, tag, token)
        _clip_coupon_by_tag(card_number: card_number, tag: tag, token: token)
      end

      # Clip the offers identified by 'ids' to the specified 'card_number'.
      #
      # @param card_number [String] card number to clip the offers to
      # @param ids [Array<Integer>] list of offer ids to clip to 'card_number'
      # @param token [String] api_user_credentials auth
      def clip_coupons_by_id(card_number, ids, token)
        _clip_coupons_by_id(card_number: card_number, ids: ids, token: token)
      end
    end
  end
end
