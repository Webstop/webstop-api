module WebstopApi
  class Coupon < Base
    attr_accessor :id, :source_coupon_id, :brand, :recipe_title, :recipe_number,
      :category, :department, :value, :title, :description, :short_description,
      :details, :fine_print, :image_path, :display_start_date, :display_end_date,
      :live_date, :expire_date, :tags, :retailer_sponsored, :min_purchase,
      :key_ingredient, :hidden, :sharable, :completed_immigration, :status,
      :issuer_status
  end
end
