require 'webstop-api/rest/resources'
require 'webstop-api/models/program'
module WebstopApi
  module REST
    module Programs
      include WebstopApi::REST::Resources

      def _all_programs(options = {})
        programs = v2_retailer_connection.get do |req|
          req.url "programs.json", api_user_credentials: options[:token]
        end
        JSON.parse(programs.body)["programs"] rescue []
      end

      def _all_programs_by_card_number(options = {})
        programs = v2_retailer_connection.get do |req|
          req.url "cards/#{options[:card_number]}/programs.json", api_user_credentials: options[:token]
        end
        JSON.parse(programs.body)["programs"] rescue []
      end

      def _program(options = {})
        program = v2_retailer_connection.get do |req|
          req.url "programs/#{options[:program_id]}.json", api_user_credentials: options[:token]
        end
        JSON.parse(program.body)["program"] rescue nil
      end

      def _cards(options = {})
        cards = v2_retailer_connection.get do |req|
          req.url "programs/#{options[:program_id]}/cards.json", api_user_credentials: options[:token]
        end
        JSON.parse(cards.body)["cards"] rescue []
      end

      def _add_card(options = {})
        card = v2_retailer_connection.post do |req|
          req.url "programs/#{options[:program_id]}/cards/#{options[:card_number]}.json", api_user_credentials: options[:token]
        end
        JSON.parse(card.body)["card"] rescue nil
      end

      def _add_consumer_to_program(options = {})
        response = v3_retailer_connection.post do |req|
          req.url "programs/#{options[:program_id]}/consumers/#{options[:consumer_id]}.json", consumer_credentials: options[:token]
        end
        JSON.parse(response.body)
      end

    end
  end
end
