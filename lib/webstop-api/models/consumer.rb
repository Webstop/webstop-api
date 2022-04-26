module WebstopApi
  class Consumer < Base
    attr_accessor :id, :first_name, :last_name, :middle_name, :email, :card_number, :legacy_card_number,
      :primary_card_number, :consumer_credentials, :address1, :address2, :city, :state, :zip, :phone_work,
      :phone_home, :phone_mobile, :cell_provider, :sms_enabled, :remember_me, :gender, :date_of_birth,
      :registered, :store_number
  end
end
