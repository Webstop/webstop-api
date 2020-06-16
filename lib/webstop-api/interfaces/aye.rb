require "webstop-api/rest/aye"

module WebstopApi
  module Interfaces
    module Aye
      include WebstopApi::REST::Aye

      def track(name, properties, card_number = nil, consumer_id = nil)
        _track(name: name, properties: properties, card_number: card_number)
      end

    end
  end
end
