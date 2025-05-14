module WebstopApi
  class Store < Base
    attr_accessor :id, :created_at, :updated_at, :retailer_id, :store_number, :longitude, :latitude, 
    :address_1, :address_2, :city, :state, :zip, :email, :phone, :pharmacy_phone, :floral_phone, 
    :employment_phone, :country_subdivision_id, :parent_site_id, :web_fees, :active, :date_open, 
    :date_close, :wholesaler_store_number, :retailer_marketing_group_id, :circular_type, 
    :sunday_open, :sunday_close, :monday_open, :monday_close, :tuesday_open, :tuesday_close, 
    :wednesday_open, :wednesday_close, :thursday_open, :thursday_close, :friday_open, :friday_close, 
    :saturday_open, :saturday_close, :time_zone, :billing_name, :WeeklyAdType, :has_fimg_ad, 
    :open_24_hours_sunday, :open_24_hours_monday, :open_24_hours_tuesday, :open_24_hours_wednesday, 
    :open_24_hours_thursday, :open_24_hours_friday, :open_24_hours_saturday, :closed_sunday, 
    :closed_monday, :closed_tuesday, :closed_wednesday, :closed_thursday, :closed_friday, 
    :closed_saturday, :AdZoneRetailer, :store_owner_id

    def initialize(store_data = {})
      store_data.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
    end

    def to_h
      instance_variables.each_with_object({}) do |var, hash|
        hash[var.to_s.delete("@").to_sym] = instance_variable_get(var)
      end
    end

    def format_phone(phone)
      return phone unless phone.is_a?(String) && phone.match?(/^\d{10}$/)
      phone.gsub(/(\d{3})(\d{3})(\d{4})/, '\1-\2-\3')
    end
  end
end
