require "webstop-api/version"
require "webstop-api/configuration"

module WebstopApi

  autoload :Base, "webstop-api/models/base"
  autoload :Consumer, "webstop-api/models/consumer"
  autoload :ConsumerSession, "webstop-api/models/consumer_session"
  autoload :Coupon, "webstop-api/models/coupon"
  autoload :ExternalSource, "webstop-api/models/external_source"
  autoload :Client, "webstop-api/models/client"
  autoload :ShoppingList, "webstop-api/models/shopping_list"
  autoload :Retailer, "webstop-api/models/retailer"

  extend Configuration
end
