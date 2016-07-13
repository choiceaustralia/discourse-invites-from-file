lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'discourse-invites-from-file'
  spec.version       = '0.2.0'
  spec.authors       = ['Rimian Perkins']
  spec.email         = ['r.perkins@rimian.com.au']
  spec.description   = 'Import user details from a file and generate invite links for discourse'
  spec.summary       = 'Run a rake task against a CSV file and a new CSV is created with invite links'
  spec.homepage      = 'https://github.com/choiceaustralia/discourse-invites-from-file'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'discourse_api', '~> 0.10'
  spec.add_dependency 'rake', '~> 11.2'
  spec.add_dependency 'dotenv', '~> 2.1'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 0.41'

  spec.required_ruby_version = '>= 2.2.3'
end
