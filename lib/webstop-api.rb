require "webstop-api/version"
require "webstop-api/configuration"
require "date"
require "active_support/core_ext/hash/indifferent_access"

module WebstopApi

  autoload :ApiUser, "webstop-api/models/api_user"
  autoload :Base, "webstop-api/models/base"
  autoload :Card, "webstop-api/models/card"
  autoload :Consumer, "webstop-api/models/consumer"
  autoload :User, "webstop-api/models/user"
  autoload :ConsumerSession, "webstop-api/models/consumer_session"
  autoload :Coupon, "webstop-api/models/coupon"
  autoload :ExternalSource, "webstop-api/models/external_source"
  autoload :Client, "webstop-api/models/client"
  autoload :Program, "webstop-api/models/program"
  autoload :ShoppingList, "webstop-api/models/shopping_list"
  autoload :Retailer, "webstop-api/models/retailer"
  autoload :Store, "webstop-api/models/store"

  extend Configuration
end
