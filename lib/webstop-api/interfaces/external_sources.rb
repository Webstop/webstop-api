require "webstop-api/rest/external_sources"
module WebstopApi
  module Interfaces
    module ExternalSources
      include WebstopApi::REST::ExternalSources

      def all_external_sources
        _all_external_sources
      end
      
    end
  end
end
