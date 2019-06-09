module WebstopApi
  class User < Base
    attr_accessor :id, :display_name, :email, :type, :ldc_id, :single_access_token 
  end
end
