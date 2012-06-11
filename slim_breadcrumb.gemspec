# -*- encoding: utf-8 -*-
require File.expand_path('../lib/slim_breadcrumb/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "slim_breadcrumb"
  gem.authors       = ["Sebastian Fiedlschuster"]
  gem.email         = ["sebastian@fiedlschuster.de"]
  gem.description   = %q{Slim out certain elements of a breadcrumb navigation and show these elements only if the user\'s mouse dwellls on the breadcrumb separator.}
  gem.summary       = %q{Slim out certain elements of a breadcrumb navigation and show these elements only if the user\'s mouse dwellls on the breadcrumb separator.}
  gem.homepage      = "https://github.com/fiedl/slim_breadcrumb"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "slim_breadcrumb"
  gem.require_paths = ["lib"]
  gem.version       = SlimBreadcrumb::VERSION

  gem.add_dependency "rails", ">= 3.2"
  gem.add_dependency "jquery-rails"
  gem.add_dependency 'sass-rails'
  gem.add_dependency 'coffee-rails'

  gem.add_development_dependency "rake"
  gem.add_development_dependency "bundler"
  gem.add_development_dependency "rspec-rails", ">= 2.8.0"
  gem.add_development_dependency "guard", "1.0.1"
  gem.add_development_dependency "nokogiri", ">= 1.5.0"
  gem.add_development_dependency "capybara"
  gem.add_development_dependency 'rspec-rails', '2.10.0'
  gem.add_development_dependency 'guard-rspec', '0.5.5'

  gem.add_development_dependency 'execjs'
  gem.add_development_dependency 'therubyracer'

end

