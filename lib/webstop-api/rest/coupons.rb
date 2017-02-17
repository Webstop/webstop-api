require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Coupons
      include WebstopApi::REST::Resources

      def _get_all_coupons(options = {})
        response = RestClient.get "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/coupons.json?consumer_credentials=#{options[:token]}"
        JSON.parse(response) rescue { coupons: [] }
      end

      def _get_clipped_coupons(options = {})
        response = RestClient.get "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/coupons/clipped.json?consumer_credentials=#{options[:token]}"
        JSON.parse(response)
      end

      def _get_coupon(id, options = {})
        response = RestClient.get "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/coupons/#{id}.json?consumer_credentials=#{options[:token]}"
        JSON.parse(response)
      end

      def _get_targeted_coupons(options = {})
        response = RestClient.get "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/coupons/targeted.json?consumer_credentials=#{options[:token]}"
        JSON.parse(response)
      end

      def _clip_coupon(id, options = {})
        response = RestClient.post "#{ WebstopApi.endpoint }/api/#{ WebstopApi.api_version }/retailers/#{ WebstopApi.retailer_id }/coupons/#{id}/clip.json?consumer_credentials=#{options[:token]}", {}
        JSON.parse(response)
      end

    end
  end
end
