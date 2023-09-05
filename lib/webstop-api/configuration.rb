module WebstopApi
  module Configuration
    VALID_CONNECTION_KEYS = [:endpoint, :method].freeze
    VALID_OPTIONS_KEYS    = [:api_key, :format, :access_key, :retailer_id, :api_version].freeze
    VALID_CONFIG_KEYS     = VALID_CONNECTION_KEYS + VALID_OPTIONS_KEYS

    DEFAULT_ENDPOINT     = 'https://api.grocerywebsite.com'
    DEFAULT_METHOD       = :get
    DEFAULT_ACCESS_KEY   = nil
    DEFAULT_RETAILER_ID  = nil
    DEFAULT_API_VERSION  = "v3"

    DEFAULT_API_KEY      = nil
    DEFAULT_FORMAT       = :json

    # Build accessor methods for every config options so we can do this, for example:
    #   Demandware.format = :xml
    attr_accessor *VALID_CONFIG_KEYS

    # Make sure we have the default values set when we get 'extended'
    def self.extended(base)
      base.reset
    end

    def reset
      self.endpoint    = ENV["WEBSTOP_API_URL"] || DEFAULT_ENDPOINT
      self.method      = DEFAULT_METHOD
      self.retailer_id = ENV["WEBSTOP_API_RETAILER_ID"] || DEFAULT_RETAILER_ID
      self.api_version = ENV["WEBSTOP_API_VERSION"] || DEFAULT_API_VERSION
      self.api_key     = DEFAULT_API_KEY
      self.format      = DEFAULT_FORMAT
      self.access_key  = DEFAULT_ACCESS_KEY
    end

    def configure
      yield self
    end

    def options
      Hash[ *VALID_CONFIG_KEYS.map { |key| [key, send(key)] }.flatten ]
    end
  end
end
