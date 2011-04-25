# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{oa-oauth}
  s.version = "0.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Bleigh", "Erik Michaels-Ober"]
  s.date = %q{2011-04-22}
  s.description = %q{OAuth strategies for OmniAuth.}
  s.email = ["michael@intridea.com", "sferik@gmail.com"]
  s.files = ["spec/fixtures/basecamp_200.xml", "spec/fixtures/campfire_200.json", "spec/omniauth/strategies/bitly_spec.rb", "spec/omniauth/strategies/dailymile_spec.rb", "spec/omniauth/strategies/doit_spec.rb", "spec/omniauth/strategies/dopplr_spec.rb", "spec/omniauth/strategies/evernote_spec.rb", "spec/omniauth/strategies/facebook_spec.rb", "spec/omniauth/strategies/foursquare_spec.rb", "spec/omniauth/strategies/github_spec.rb", "spec/omniauth/strategies/goodreads_spec.rb", "spec/omniauth/strategies/google_spec.rb", "spec/omniauth/strategies/gowalla_spec.rb", "spec/omniauth/strategies/hyves_spec.rb", "spec/omniauth/strategies/identica_spec.rb", "spec/omniauth/strategies/linked_in_spec.rb", "spec/omniauth/strategies/meetup_spec.rb", "spec/omniauth/strategies/miso_spec.rb", "spec/omniauth/strategies/netflix_spec.rb", "spec/omniauth/strategies/oauth2_spec.rb", "spec/omniauth/strategies/oauth_spec.rb", "spec/omniauth/strategies/salesforce_spec.rb", "spec/omniauth/strategies/smug_mug_spec.rb", "spec/omniauth/strategies/sound_cloud_spec.rb", "spec/omniauth/strategies/teambox_spec.rb", "spec/omniauth/strategies/thirty_seven_signals_spec.rb", "spec/omniauth/strategies/trade_me_spec.rb", "spec/omniauth/strategies/trip_it_spec.rb", "spec/omniauth/strategies/tumblr_spec.rb", "spec/omniauth/strategies/twitter_spec.rb", "spec/omniauth/strategies/type_pad_spec.rb", "spec/omniauth/strategies/vimeo_spec.rb", "spec/omniauth/strategies/vkontakte_spec.rb", "spec/omniauth/strategies/yahoo_spec.rb", "spec/omniauth/strategies/you_tube_spec.rb", "spec/spec_helper.rb", "spec/support/shared_examples.rb"]
  s.homepage = %q{http://github.com/intridea/omniauth}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{OAuth strategies for OmniAuth.}
  s.test_files = ["spec/fixtures/basecamp_200.xml", "spec/fixtures/campfire_200.json", "spec/omniauth/strategies/bitly_spec.rb", "spec/omniauth/strategies/dailymile_spec.rb", "spec/omniauth/strategies/doit_spec.rb", "spec/omniauth/strategies/dopplr_spec.rb", "spec/omniauth/strategies/evernote_spec.rb", "spec/omniauth/strategies/facebook_spec.rb", "spec/omniauth/strategies/foursquare_spec.rb", "spec/omniauth/strategies/github_spec.rb", "spec/omniauth/strategies/goodreads_spec.rb", "spec/omniauth/strategies/google_spec.rb", "spec/omniauth/strategies/gowalla_spec.rb", "spec/omniauth/strategies/hyves_spec.rb", "spec/omniauth/strategies/identica_spec.rb", "spec/omniauth/strategies/linked_in_spec.rb", "spec/omniauth/strategies/meetup_spec.rb", "spec/omniauth/strategies/miso_spec.rb", "spec/omniauth/strategies/netflix_spec.rb", "spec/omniauth/strategies/oauth2_spec.rb", "spec/omniauth/strategies/oauth_spec.rb", "spec/omniauth/strategies/salesforce_spec.rb", "spec/omniauth/strategies/smug_mug_spec.rb", "spec/omniauth/strategies/sound_cloud_spec.rb", "spec/omniauth/strategies/teambox_spec.rb", "spec/omniauth/strategies/thirty_seven_signals_spec.rb", "spec/omniauth/strategies/trade_me_spec.rb", "spec/omniauth/strategies/trip_it_spec.rb", "spec/omniauth/strategies/tumblr_spec.rb", "spec/omniauth/strategies/twitter_spec.rb", "spec/omniauth/strategies/type_pad_spec.rb", "spec/omniauth/strategies/vimeo_spec.rb", "spec/omniauth/strategies/vkontakte_spec.rb", "spec/omniauth/strategies/yahoo_spec.rb", "spec/omniauth/strategies/you_tube_spec.rb", "spec/spec_helper.rb", "spec/support/shared_examples.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oa-core>, ["= 0.2.4"])
      s.add_runtime_dependency(%q<multi_json>, [">= 0.0.5"])
      s.add_runtime_dependency(%q<nokogiri>, ["~> 1.4.2"])
      s.add_runtime_dependency(%q<oauth>, ["~> 0.4.0"])
      s.add_runtime_dependency(%q<faraday>, ["~> 0.6.1"])
      s.add_runtime_dependency(%q<oauth2>, ["~> 0.4.1"])
      s.add_development_dependency(%q<evernote>, ["~> 0.9"])
      s.add_development_dependency(%q<rack-test>, ["~> 0.5"])
      s.add_development_dependency(%q<rake>, ["~> 0.8"])
      s.add_development_dependency(%q<rspec>, ["~> 2.5"])
      s.add_development_dependency(%q<webmock>, ["~> 1.6"])
      s.add_development_dependency(%q<yard>, ["~> 0.6"])
    else
      s.add_dependency(%q<oa-core>, ["= 0.2.4"])
      s.add_dependency(%q<multi_json>, [">= 0.0.5"])
      s.add_dependency(%q<nokogiri>, ["~> 1.4.2"])
      s.add_dependency(%q<oauth>, ["~> 0.4.0"])
      s.add_dependency(%q<faraday>, ["~> 0.6.1"])
      s.add_dependency(%q<oauth2>, ["~> 0.4.1"])
      s.add_dependency(%q<evernote>, ["~> 0.9"])
      s.add_dependency(%q<rack-test>, ["~> 0.5"])
      s.add_dependency(%q<rake>, ["~> 0.8"])
      s.add_dependency(%q<rspec>, ["~> 2.5"])
      s.add_dependency(%q<webmock>, ["~> 1.6"])
      s.add_dependency(%q<yard>, ["~> 0.6"])
    end
  else
    s.add_dependency(%q<oa-core>, ["= 0.2.4"])
    s.add_dependency(%q<multi_json>, [">= 0.0.5"])
    s.add_dependency(%q<nokogiri>, ["~> 1.4.2"])
    s.add_dependency(%q<oauth>, ["~> 0.4.0"])
    s.add_dependency(%q<faraday>, ["~> 0.6.1"])
    s.add_dependency(%q<oauth2>, ["~> 0.4.1"])
    s.add_dependency(%q<evernote>, ["~> 0.9"])
    s.add_dependency(%q<rack-test>, ["~> 0.5"])
    s.add_dependency(%q<rake>, ["~> 0.8"])
    s.add_dependency(%q<rspec>, ["~> 2.5"])
    s.add_dependency(%q<webmock>, ["~> 1.6"])
    s.add_dependency(%q<yard>, ["~> 0.6"])
  end
end
