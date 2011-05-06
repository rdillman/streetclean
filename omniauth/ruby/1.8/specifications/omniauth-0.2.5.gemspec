# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{omniauth}
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Bleigh", "Erik Michaels-Ober"]
  s.date = %q{2011-04-29}
  s.description = %q{OmniAuth is an authentication framework that that separates the concept of authentiation from the concept of identity, providing simple hooks for any application to have one or multiple authentication providers for a user.}
  s.email = ["michael@intridea.com", "sferik@gmail.com"]
  s.homepage = %q{http://github.com/intridea/omniauth}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Rack middleware for standardized multi-provider authentication.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oa-core>, ["= 0.2.5"])
      s.add_runtime_dependency(%q<oa-oauth>, ["= 0.2.5"])
      s.add_runtime_dependency(%q<oa-basic>, ["= 0.2.5"])
      s.add_runtime_dependency(%q<oa-openid>, ["= 0.2.5"])
      s.add_runtime_dependency(%q<oa-enterprise>, ["= 0.2.5"])
      s.add_runtime_dependency(%q<oa-more>, ["= 0.2.5"])
    else
      s.add_dependency(%q<oa-core>, ["= 0.2.5"])
      s.add_dependency(%q<oa-oauth>, ["= 0.2.5"])
      s.add_dependency(%q<oa-basic>, ["= 0.2.5"])
      s.add_dependency(%q<oa-openid>, ["= 0.2.5"])
      s.add_dependency(%q<oa-enterprise>, ["= 0.2.5"])
      s.add_dependency(%q<oa-more>, ["= 0.2.5"])
    end
  else
    s.add_dependency(%q<oa-core>, ["= 0.2.5"])
    s.add_dependency(%q<oa-oauth>, ["= 0.2.5"])
    s.add_dependency(%q<oa-basic>, ["= 0.2.5"])
    s.add_dependency(%q<oa-openid>, ["= 0.2.5"])
    s.add_dependency(%q<oa-enterprise>, ["= 0.2.5"])
    s.add_dependency(%q<oa-more>, ["= 0.2.5"])
  end
end
