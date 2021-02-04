
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "smsc/version"

Gem::Specification.new do |spec|
  spec.name          = "smsc"
  spec.version       = SMSC::VERSION
  spec.authors       = ["Pavel Tkachenko"]
  spec.email         = ["tpepost@gmail.com"]

  spec.summary       = %q{smsc wrapper (smsc.ru, smsc.kz)}
  spec.description   = %q{smsc wrapper (Send SMS, MMS, Voice Messages, etc.)}
  spec.homepage      = "https://github.com/PavelTkachenko/SMSC"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "dry-types",        "~> 1.2"
  spec.add_runtime_dependency "dry-monads",       "~> 1.3"
  spec.add_runtime_dependency "dry-configurable", "~> 0.11"

  spec.add_development_dependency "bundler", "~> 2"
  spec.add_development_dependency "rake",    "~> 13.0"
  spec.add_development_dependency "rspec",   "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3"
end
