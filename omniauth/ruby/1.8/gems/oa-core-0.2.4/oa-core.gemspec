# -*- encoding: utf-8 -*-
require File.expand_path('../../omniauth/lib/omniauth/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_development_dependency 'simplecov', '~> 0.4'
  gem.add_development_dependency 'rack-test', '~> 0.5'
  gem.add_development_dependency 'rake', '~> 0.8'
  gem.add_development_dependency 'rspec', '~> 2.5'
  gem.add_development_dependency 'yard', '~> 0.6'
  gem.name = 'oa-core'
  gem.version = Omniauth::VERSION.dup
  gem.summary = %q{HTTP Basic strategies for OmniAuth.}
  gem.description = %q{HTTP Basic strategies for OmniAuth.}
  gem.email = ['michael@intridea.com', 'sferik@gmail.com']
  gem.homepage = 'http://github.com/intridea/omniauth'
  gem.authors = ['Michael Bleigh', 'Erik Michaels-Ober']
  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ['lib']
  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6') if gem.respond_to? :required_rubygems_version=
end
