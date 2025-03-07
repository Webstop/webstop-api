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

    def initialize(api_data = {})
      @store_number = api_data.dig("storeNumber").to_i
      @billing_name = api_data.dig("storeName")
      @address_1 = api_data.dig("address", "address1")
      @address_2 = api_data.dig("address", "address2")
      @city = api_data.dig("address", "cityOrTown")
      @state = api_data.dig("address", "stateOrProvince")
      @zip = api_data.dig("address", "postalOrZipCode").gsub('-', '')
      @latitude = api_data.dig("geo", "lat").to_s
      @longitude = api_data.dig("geo", "lng").to_s
      @phone = format_phone(api_data.dig("phone"))

      # Map open and close times
      %w[sunday monday tuesday wednesday thursday friday saturday].each do |day|
        instance_variable_set("@#{day}_open", api_data.dig("regularHours", day, "openTime"))
        instance_variable_set("@#{day}_close", api_data.dig("regularHours", day, "closeTime"))
        instance_variable_set("@closed_#{day}", api_data.dig("regularHours", day, "isClosed"))
        
        # Handle 24-hour stores
        open_24_hours = api_data.dig("regularHours", day, "label") == "12:01AM-12:01AM"
        instance_variable_set("@open_24_hours_#{day}", open_24_hours)
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
