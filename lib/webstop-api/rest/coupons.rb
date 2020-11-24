require 'erb'
require 'webstop-api/rest/resources'

module WebstopApi
  module REST
    module Coupons
      include WebstopApi::REST::Resources

      def _get_all_coupons(options = {})
        if !options[:card_number].nil?
          coupons = v2_retailer_connection.get do |req|
            req.url "cards/#{options[:card_number]}/coupons.json?api_user_credentials=#{options[:token]}"
          end
        else
          coupons = v2_retailer_connection.get do |req|
            req.url "coupons", consumer_credentials: options[:token]
          end
        end
        JSON.parse(coupons.body) rescue { coupons: [] }
      end

      def _get_clipped_coupons(options = {})
        if !options[:card_number].nil?
          coupons = v2_retailer_connection.get do |req|
            req.url "cards/#{options[:card_number]}/coupons/clipped.json?api_user_credentials=#{options[:token]}"
          end
        else
          coupons = v2_retailer_connection.get do |req|
            req.url "coupons/clipped", consumer_credentials: options[:token]
          end
        end
        JSON.parse(coupons.body) rescue { coupons: [] }
      end

      def _search_coupons(query, options = {})
        coupons = v2_retailer_connection.get do |req|
          query_param = ERB::Util.url_encode(query.to_json)
          req.url "coupons/search.json?api_user_credentials=#{options[:token]}&query=#{query_param}"
        end
        if coupons.status != 200
          raise JSON.parse(coupons.body)['errors'].join(',')
        end
        JSON.parse(coupons.body)
      end

      def _get_coupon(id, options = {})
        coupon = v2_retailer_connection.get do |req|
          req.url "coupons/#{id}", consumer_credentials: options[:token]
        end
        JSON.parse(coupon.body) rescue { coupon: {} }
      end

      def _get_coupons_by_tag(options = {})
        # `GET` /api/v2/retailers/:retailer_id/cards/:card_id/coupons/tag/:tag.json
        # `GET` /api/v2/retailers/:retailer_id/coupons/tag/:tag.json
        coupons = v2_retailer_connection.get do |req|
          if !options[:card_number].nil?
            req.url "cards/#{options[:card_number]}/coupons/tag/#{options[:tag]}.json", api_user_credentials: options[:token]
          else
            req.url "coupons/tag/#{options[:tag]}.json", api_user_credentials: options[:token], src: 'db'
          end
        end
        JSON.parse(coupons.body) rescue { coupons: [] }
      end

      def _get_targeted_coupons(options = {})
        coupons = v2_retailer_connection.get do |req|
          req.url "coupons/targeted", consumer_credentials: options[:token]
        end
        JSON.parse(coupons.body) rescue { coupons: [] }
      end

      def _clip_coupon(options = {})
        coupon = v2_retailer_connection.post do |req|
          req.url "coupons/#{options[:id]}/clip", consumer_credentials: options[:token]
        end
        JSON.parse(coupon.body)
      end

      def _legacy_clip_coupon(options = {})
        coupon = v2_retailer_connection.post do |req|
          req.url "cards/#{options[:card_number]}/coupons/#{options[:id]}/clip.json", api_user_credentials: options[:token]
        end
        JSON.parse(coupon.body)
      end

      def _clip_coupon_by_tag(options = {})
        coupons = v2_retailer_connection.post do |req|
          req.url "cards/#{options[:card_number]}/coupons/tag/#{options[:tag]}/clip.json", api_user_credentials: options[:token]
        end
        JSON.parse(coupons.body)
      end

      def _clip_coupons_by_id(options = {})
        coupons = v2_retailer_connection.post do |req|
          req.url "cards/#{options[:card_number]}/coupons/#{options[:ids].join(',')}/clip_multiple.json", api_user_credentials: options[:token]
        end
        JSON.parse(coupons.body)
      end

    end
  end
end
