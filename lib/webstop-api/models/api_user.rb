module WebstopApi
  class ApiUser < Base
    attr_accessor :first_name, :legacy_token, :api_user_credentials, :email, :preferred_store_number,
      :last_name, :card_number, :upc_11, :registered
  end
end
