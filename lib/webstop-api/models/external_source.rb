module WebstopApi
  class ExternalSource < Base
    attr_accessor :retailer_id, :model, :name, :provider, :input_type, :size, :validation_rule_set
  end
end
