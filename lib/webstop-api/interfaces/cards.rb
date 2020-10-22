require "webstop-api/rest/cards"

module WebstopApi
  module Interfaces
    module Cards
      include WebstopApi::REST::Cards

      # eg: @core_api.card("0000000198", @legacy_credentials.api_user_credentials)
      def card(card_number, api_token)
        result = _card(card_number: card_number, token: api_token)
        Card.new(result)
      end
    end
  end
end
