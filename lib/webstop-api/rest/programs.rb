require 'webstop-api/rest/resources'
require 'webstop-api/models/program'
module WebstopApi
  module REST
    module Programs
      include WebstopApi::REST::Resources

      def _all_programs(options = {})
        programs = retailer_connection.get do |req|
          req.url "programs.json", api_user_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(programs.body)["programs"] rescue []
      end

      def _all_programs_by_card_number(options = {})
        programs = retailer_connection.get do |req|
          req.url "cards/#{options[:card_number]}/programs.json", api_user_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(programs.body)["programs"] rescue []
      end

      def _program(options = {})
        program = retailer_connection.get do |req|
          req.url "programs/#{options[:program_id]}.json", api_user_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(program.body)["program"] rescue nil
      end

      def _cards(options = {})
        cards = retailer_connection.get do |req|
          req.url "programs/#{options[:program_id]}/cards.json", api_user_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(cards.body)["cards"] rescue []
      end

      def _add_card(options = {})
        card = retailer_connection.post do |req|
          req.url "programs/#{options[:program_id]}/cards/#{options[:card_number]}.json", api_user_credentials: options[:token]
          req.headers['Content-Type'] = 'application/json'
        end
        JSON.parse(card.body)["card"] rescue nil
      end

      def retailer_connection
        Faraday.new("#{ WebstopApi.endpoint }/api/v2/retailers/#{WebstopApi.retailer_id}")
      end

    end
  end
end
