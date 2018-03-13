require 'webstop-api/utilities/object_factory'
require 'faraday'
require 'pry'

module WebstopApi

  module REST
    module Resources
      include WebstopApi::ObjectFactory

      STATUSES = {
        400 => 'Missing or Malformed Input. Check your submitted information and try again.',
        401 => 'Your token is unavailable or incorrect.'
      }

      def enhanced_exception(e, custom_statuses = {})
        statuses = STATUSES.merge(custom_statuses)
        if e.respond_to?(:http_code) && statuses[e.http_code]
          new_message = "#{e.message}: #{statuses[e.http_code]}"
          e.define_singleton_method(:message) { new_message }
        end
        e
      end

    end
  end
end
