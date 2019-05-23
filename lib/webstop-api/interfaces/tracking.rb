require "webstop-api/rest/tracking"

module WebstopApi
  module Interfaces
    module Tracking
      include WebstopApi::REST::Tracking

      def track(event, properties, card_number = nil)
        _track(event: event, properties: properties, card_number: card_number)
      end

    end
  end
end
