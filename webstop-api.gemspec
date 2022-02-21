# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webstop-api/version'

Gem::Specification.new do |spec|
  spec.name          = "webstop-api"
  spec.version       = WebstopApi::VERSION
  spec.authors       = ["Don Sullivan"]
  spec.email         = ["don@webstop.com"]

  spec.summary       = %q{ provides connectivity to the webstop api. }
  spec.description   = %q{ pretty much what I just wrote in the summary }
  spec.homepage      = "http://www.webstop.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|bin|\.|bash|console|docker-compose.yml|Dockerfile|setup)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "faraday"
  spec.add_dependency "net-http-persistent" # better faraday performance
  spec.add_dependency "activesupport", '~> 5.0'
  spec.add_development_dependency "bundler", "2.0.2"
  spec.add_development_dependency "rake", "12.3.0"
  spec.add_development_dependency "pry-rails"
  spec.add_development_dependency 'awesome_print', '1.8.0'
end
