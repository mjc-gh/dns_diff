require_relative 'lib/dns_diff/version'

Gem::Specification.new do |spec|
  spec.name          = "dns_diff"
  spec.version       = DnsDiff::VERSION
  spec.authors       = ["Michael Coyne"]
  spec.email         = ["mikeycgto@gmail.com"]

  spec.summary       = "Compare DNS from one NS to another with a CLI tool"
  spec.description   = "Compare DNS from one NS to another"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.add_dependency 'colorize', '>= 0.8.1'
  spec.add_dependency 'thor', '>= 1.0.1'

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
