require 'webstop-api/rest/resources'
module WebstopApi
  module REST
    module Coupons
      include WebstopApi::REST::Resources

      def _get_all_coupons(options = {})
        if !options[:card_number].nil?
          coupons = retailer_connection.get do |req|
            req.url "cards/#{options[:card_number]}/coupons.json?api_user_credentials=#{options[:token]}"
            req.headers['Content-Type'] = 'application/json'
          end
        else
          coupons = retailer_connection.get do |req|
            req.url "coupons", consumer_credentials: options[:token]
            req.headers['Content-Type'] = 'application/json'
          end
        end

        JSON.parse(coupons.body) rescue { coupons: [] }
      end

      def _get_clipped_coupons(options = {})
        if !options[:card_number].nil?
          coupons = retailer_connection.get do |req|
            req.url "cards/#{options[:card_number]}/coupons/clipped.json?api_user_credentials=#{options[:token]}"
            req.headers['Content-Type'] = 'application/json'
          end
        else
          coupons = retailer_connection.get do |req|
            req.url "coupons/clipped", consumer_credentials: options[:token]
            req.headers['Content-Type'] = 'application/json'
          end
        end
        JSON.parse(coupons.body) rescue { coupons: [] }
      end

      def _get_coupon(id, options = {})
        coupon = retailer_connection.get do |req|
          req.url "coupons/#{id}", consumer_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(coupon.body) rescue { coupon: {} }
      end

      def _get_coupons_by_tag(options = {})
        # `GET` /api/v2/retailers/:retailer_id/cards/:card_id/coupons/tag/:tag.json
        # `GET` /api/v2/retailers/:retailer_id/coupons/tag/:tag.json
        coupons = v2_connection.get do |req|
          if !options[:card_number].nil?
            req.url "cards/#{options[:card_number]}/coupons/tag/#{options[:tag]}.json", api_user_credentials: options[:token]
          else
            req.url "coupons/tag/#{options[:tag]}.json", api_user_credentials: options[:token]
          end
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(coupons.body) rescue { coupons: [] }
      end

      def _get_targeted_coupons(options = {})
        coupons = retailer_connection.get do |req|
          req.url "coupons/targeted", consumer_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(coupons.body) rescue { coupons: [] }
      end

      def _clip_coupon(options = {})
        coupon = retailer_connection.post do |req|
          req.url "coupons/#{options[:id]}/clip", consumer_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(coupon.body)
      end

      def _legacy_clip_coupon(options = {})
        coupon = v2_connection.post do |req|
          req.url "cards/#{options[:card_number]}/coupons/#{options[:id]}/clip.json", api_user_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(coupon.body)
      end

      def _clip_coupon_by_tag(options = {})
        coupons = v2_connection.post do |req|
          req.url "cards/#{options[:card_number]}/coupons/tag/#{options[:tag]}/clip.json", api_user_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(coupons.body)
      end

      def v2_connection
        Faraday.new("#{ WebstopApi.endpoint }/api/v2/retailers/#{WebstopApi.retailer_id}")
      end

    end
  end
end
