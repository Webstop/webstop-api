require 'webstop-api/rest/cards'
require 'webstop-api/utilities/enumerable_utils'

module WebstopApi
  module Interfaces
    module Cards
      include WebstopApi::REST::Cards

      # Get a single Card instance by 'card_number'.
      #
      # eg: @core_api.card("0000000198", @legacy_credentials.api_user_credentials)
      #
      # @param card_number [String] card_number of Card to be retrieved
      # @api_token [String] api_user_credentials token
      # @return [Card] Card that matched 'card_number'
      def card(card_number, api_token)
        result = _card(card_number: card_number, token: api_token)
        Card.new(result)
      end

      # Get list of cards identified by 'card_numbers' in no specific order.
      # Note that the cards will be retrieved from the core rails api in batches
      # of 165 due to request size limits.
      #
      # eg: @core_api.card(["0000000198","0000000197"], @legacy_credentials.api_user_credentials)
      #
      # @param card_numbers [Array<String>] list of card_numbers
      # @api_token [String] api_user_credentials token
      # @return [Array<Card>] Array of matching Card instances
      def cards(card_numbers, api_token)
        EnumerableUtils.batch_reduce([], card_numbers, 165) do |combined_result, card_numbers|
          result = _card(card_number: card_numbers.join(','), token: api_token)
          combined_result += result.collect{|card| Card.new(card)}
        end
      end

    end
  end
end
