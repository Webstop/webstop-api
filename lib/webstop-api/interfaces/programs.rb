require "webstop-api/rest/programs"

module WebstopApi
  module Interfaces
    module Programs
      include WebstopApi::REST::Programs

      # supports both v2 and v3
      def get_programs(api_token)
        programs = _all_programs(token: api_token)
        programs.map{ |program| Program.new(program) }
      end

      def get_programs_by_card_number(card_number, api_token)
        _all_programs_by_card_number(token: api_token, card_number: card_number)
      end

      def get_programs_by_consumer(consumer_id, api_token)
        _all_programs_by_consumer(token: api_token, consumer_id: consumer_id)
      end

      def get_program(program_id, api_token)
        program = _program(program_id: program_id, token: api_token)
        Program.new(program)
      end

      def cards_for_program(program_id, api_token)
        results = _cards(program_id: program_id, token: api_token)
        results.map{ |card| Card.new(card) }
      end

      def add_card_to_program(program_id, card_number, api_token)
        _add_card(program_id: program_id, card_number: card_number, token: api_token)
      end

      # Add consumer to program.  Both the consumer and program must already
      # exists in core.
      #
      # @param program_id [int] identifies existing program
      # @param consumer_id [int] identifies existing consumer to be added to program
      # @return [boolean] true if successful
      # @raise [RuntimeException] message describing why association failed
      def add_consumer_to_program(program_id, consumer_id, api_token)
        response = _add_consumer_to_program(program_id: program_id, consumer_id: consumer_id, token: api_token)
        if response['errors']
          raise response['errors'].join('; ')
        else
          true
        end
      end

      # Get consumers for specified program.
      #
      # @param program_id [int] identifies existing program
      # @return [Array<Consumer>] list of api consumers
      # @raise [RuntimeException] message describing failure
      def consumers_for_program(program_id, api_token)
        response = _consumers_for_program(program_id: program_id, token: api_token)
        if response.is_a?(Array)
          response.collect{|consumer| Consumer.new(consumer)}
        else
          if response['errors']
            raise response['errors'].join('; ')
          else
            raise "failed to parse response to consumers_for_program()"
          end
        end
      end

    end
  end
end
