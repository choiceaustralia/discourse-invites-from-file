
Gem::Specification.new do |spec|
  spec.name          = "discourse-invites-from-file"
  spec.version       = '0.1.0'
  spec.authors       = ['Rimian Perkins']
  spec.email         = ['r.perkins@rimian.com.au']
  spec.description   = %q{Import user details from a file and generate invite links for discourse}
  spec.summary       = %q{Run a rake task against a CSV file and a new CSV is created with invite links}
  spec.homepage      = "https://github.com/choiceaustralia/discourse-invites-from-file"
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.12"

  spec.required_ruby_version = '>= 2.2.3'
end
