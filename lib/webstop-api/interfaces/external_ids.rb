require "webstop-api/rest/external_ids"
module WebstopApi
  module Interfaces
    module ExternalIds
      include WebstopApi::REST::ExternalIds

      def all_external_ids(id)
        _all_external_ids(id, token: token)
      end

      def add_external_id(id, program_id, external_id_data)
        _add_external_id(id, program_id, external_id_data, token: token)
      end

    end
  end
end
