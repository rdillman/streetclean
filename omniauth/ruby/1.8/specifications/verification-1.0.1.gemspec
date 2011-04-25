# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{verification}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Heinemeier Hansson"]
  s.date = %q{2010-11-15}
  s.description = %q{Verify preconditions for Rails actions}
  s.email = ["david@loudthinking.com"]
  s.files = ["test/test_helper.rb", "test/verification_test.rb"]
  s.homepage = %q{https://rubygems.org/gems/verification}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{Verify preconditions for Rails actions}
  s.test_files = ["test/test_helper.rb", "test/verification_test.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, ["~> 3.0.0"])
      s.add_runtime_dependency(%q<actionpack>, ["~> 3.0.0"])
    else
      s.add_dependency(%q<activesupport>, ["~> 3.0.0"])
      s.add_dependency(%q<actionpack>, ["~> 3.0.0"])
    end
  else
    s.add_dependency(%q<activesupport>, ["~> 3.0.0"])
    s.add_dependency(%q<actionpack>, ["~> 3.0.0"])
  end
end
