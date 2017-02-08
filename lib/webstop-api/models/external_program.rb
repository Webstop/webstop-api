module WebstopApi
  class ExternalProgram < Base
    attr_accessor :retailer_id, :model, :name, :provider, :input_type, :size, :validation_rule_set
  end
end
