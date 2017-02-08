require "webstop-api/rest/external_programs"
module WebstopApi
  module Interfaces
    module ExternalPrograms
      include WebstopApi::REST::ExternalPrograms

      def all_external_programs
        _all_external_programs
      end

    end
  end
end
