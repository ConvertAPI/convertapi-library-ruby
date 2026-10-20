lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'convert_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'convert_api'
  spec.version       = ConvertApi::VERSION
  spec.authors       = ['Tomas Rutkauskas']
  spec.email         = ['support@convertapi.com']

  spec.summary       = %q{ConvertAPI client library}
  spec.description   = %q{Convert various files like MS Word, Excel, PowerPoint, Images to PDF and Images. Create PDF and Images from url and raw HTML. Extract and create PowerPoint presentation from PDF. Merge, Encrypt, Split, Repair and Decrypt PDF files. All supported files conversions and manipulations can be found at https://www.convertapi.com/doc/supported-formats}
  spec.homepage      = 'https://github.com/ConvertAPI/convertapi-library-ruby'
  spec.license       = 'MIT'
  spec.metadata      = {
    'source_code_uri' => 'https://github.com/ConvertAPI/convertapi-library-ruby',
    'changelog_uri' => 'https://github.com/ConvertAPI/convertapi-library-ruby/blob/main/CHANGELOG.md',
    'bug_tracker_uri' => 'https://github.com/ConvertAPI/convertapi-library-ruby/issues',
    'documentation_uri' => 'https://www.convertapi.com/doc',
  }

  spec.files         = Dir.glob('lib/**/*.rb', base: __dir__) + %w[README.md LICENSE.txt CHANGELOG.md]

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
