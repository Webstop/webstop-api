module WebstopApi
  class Base

    def initialize(params = {})
      params.each do |k,v|
        if self.respond_to?("#{k}=".to_sym)
          send("#{k}=", v)
        end
      end
    end

    # just a fancy inspection of the class instance that shows the class attrs
    def inspect
      attr_accessor_methods = self.class.public_instance_methods.select{|m| m =~ /^\w.*=$/}.sort.collect{|m| m.to_s[0...-1]}
      longest_method_length = attr_accessor_methods.map(&:size).max
      response = "#<#{self.class.name}:#{'0x%x' % (self.object_id << 1)}> {\n"
      attr_accessor_methods.each do |m|
        response += "\e[0m#{"%#{longest_method_length + 4}s" % m} \e[97m=> \e[33m#{send(m.to_sym).inspect}\e[0m\n"
      end
      response += "\e[0m}"
    end

  end
end
