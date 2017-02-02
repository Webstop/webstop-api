module WebstopApi
  class Coupon < Base
    attr_accessor :id, :brand, :recipe_title, :recipe_number, :category, :department,
      :value, :title, :description, :details, :fine_print, :image_path, :display_start_date,
      :display_end_date, :expire_date, :tags, :retailer_sponsored, :min_purchase,
      :key_ingredient, :hidden, :sharable
  end
end
