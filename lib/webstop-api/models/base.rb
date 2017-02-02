module WebstopApi
  class Base

    def initialize(params = {})
      params.each do |k,v|
        if self.respond_to?("#{k}=".to_sym)
          send("#{k}=", v)
        end
      end
    end

  end
end
