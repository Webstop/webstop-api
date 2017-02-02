require "webstop-api/version"
require "webstop-api/configuration"

module WebstopApi

  autoload :Base, "webstop-api/models/base"
  autoload :Consumer, "webstop-api/models/consumer"
  autoload :Coupon, "webstop-api/models/coupon"
  autoload :ExternalSource, "webstop-api/models/external_source"
  autoload :Client, "webstop-api/models/client"

  extend Configuration
end
