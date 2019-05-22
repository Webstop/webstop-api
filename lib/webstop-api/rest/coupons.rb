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

      def _get_targeted_coupons(options = {})
        coupons = retailer_connection.get do |req|
          req.url "coupons/targeted", consumer_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(coupons.body) rescue { coupons: [] }
      end

      def _clip_coupon(id, options = {})
        coupon = retailer_connection.post do |req|
          req.url "coupons/#{id}/clip", consumer_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(coupon.body)
      end

    end
  end
end
