require 'json'
module WebstopApi

  module ObjectFactory

    def create_object(json, klass)
      raw = JSON.parse(json)
      WebstopApi.const_get(klass.capitalize).new(raw)
    end

    def create_from_parsed_json(json, klass)
      WebstopApi.const_get(camel_case(klass)).new(json)
    end

    def camel_case(string)
      string.split('_').map{ |e| e.capitalize }.join
    end

  end

end
