require "webstop-api/rest/aye"

module WebstopApi
  module Interfaces
    module Aye
      include WebstopApi::REST::Aye

      # eg: @core_api.track('test', {a:1, b:2})
      def track(name, properties, card_number = nil, consumer_id = nil)
        _track(name: name, properties: properties, card_number: card_number)
      end

    end
  end
end
