# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{active_scaffold}
  s.version = "3.0.12"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Many, see README"]
  s.date = %q{2011-01-31}
  s.description = %q{Save time and headaches, and create a more easily maintainable set of pages, with ActiveScaffold. ActiveScaffold handles all your CRUD (create, read, update, delete) user interface needs, leaving you more time to focus on more challenging (and interesting!) problems.}
  s.email = %q{activescaffold@googlegroups.com}
  s.files = ["test/bridges/bridge_test.rb", "test/config/base_test.rb", "test/config/create_test.rb", "test/config/list_test.rb", "test/config/show_test.rb", "test/config/update_test.rb", "test/const_mocker.rb", "test/data_structures/action_columns_test.rb", "test/data_structures/action_link_test.rb", "test/data_structures/action_links_test.rb", "test/data_structures/actions_test.rb", "test/data_structures/association_column_test.rb", "test/data_structures/column_test.rb", "test/data_structures/columns_test.rb", "test/data_structures/error_message_test.rb", "test/data_structures/set_test.rb", "test/data_structures/sorting_test.rb", "test/data_structures/standard_column_test.rb", "test/data_structures/virtual_column_test.rb", "test/extensions/active_record_test.rb", "test/extensions/array_test.rb", "test/helpers/form_column_helpers_test.rb", "test/helpers/list_column_helpers_test.rb", "test/helpers/pagination_helpers_test.rb", "test/misc/active_record_permissions_test.rb", "test/misc/attribute_params_test.rb", "test/misc/configurable_test.rb", "test/misc/constraints_test.rb", "test/misc/finder_test.rb", "test/misc/lang_test.rb", "test/mock_app/app/controllers/application_controller.rb", "test/mock_app/app/helpers/application_helper.rb", "test/mock_app/config/boot.rb", "test/mock_app/config/environment.rb", "test/mock_app/config/environments/development.rb", "test/mock_app/config/environments/production.rb", "test/mock_app/config/environments/test.rb", "test/mock_app/config/initializers/backtrace_silencers.rb", "test/mock_app/config/initializers/inflections.rb", "test/mock_app/config/initializers/mime_types.rb", "test/mock_app/config/initializers/new_rails_defaults.rb", "test/mock_app/config/initializers/session_store.rb", "test/mock_app/config/routes.rb", "test/model_stub.rb", "test/run_all.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/vhochstein/active_scaffold}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{Rails 3 Version of activescaffold supporting prototype and jquery}
  s.test_files = ["test/bridges/bridge_test.rb", "test/config/base_test.rb", "test/config/create_test.rb", "test/config/list_test.rb", "test/config/show_test.rb", "test/config/update_test.rb", "test/const_mocker.rb", "test/data_structures/action_columns_test.rb", "test/data_structures/action_link_test.rb", "test/data_structures/action_links_test.rb", "test/data_structures/actions_test.rb", "test/data_structures/association_column_test.rb", "test/data_structures/column_test.rb", "test/data_structures/columns_test.rb", "test/data_structures/error_message_test.rb", "test/data_structures/set_test.rb", "test/data_structures/sorting_test.rb", "test/data_structures/standard_column_test.rb", "test/data_structures/virtual_column_test.rb", "test/extensions/active_record_test.rb", "test/extensions/array_test.rb", "test/helpers/form_column_helpers_test.rb", "test/helpers/list_column_helpers_test.rb", "test/helpers/pagination_helpers_test.rb", "test/misc/active_record_permissions_test.rb", "test/misc/attribute_params_test.rb", "test/misc/configurable_test.rb", "test/misc/constraints_test.rb", "test/misc/finder_test.rb", "test/misc/lang_test.rb", "test/mock_app/app/controllers/application_controller.rb", "test/mock_app/app/helpers/application_helper.rb", "test/mock_app/config/boot.rb", "test/mock_app/config/environment.rb", "test/mock_app/config/environments/development.rb", "test/mock_app/config/environments/production.rb", "test/mock_app/config/environments/test.rb", "test/mock_app/config/initializers/backtrace_silencers.rb", "test/mock_app/config/initializers/inflections.rb", "test/mock_app/config/initializers/mime_types.rb", "test/mock_app/config/initializers/new_rails_defaults.rb", "test/mock_app/config/initializers/session_store.rb", "test/mock_app/config/routes.rb", "test/model_stub.rb", "test/run_all.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_runtime_dependency(%q<render_component>, [">= 0"])
      s.add_runtime_dependency(%q<verification>, [">= 0"])
      s.add_runtime_dependency(%q<rails>, ["~> 3.0.0"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<render_component>, [">= 0"])
      s.add_dependency(%q<verification>, [">= 0"])
      s.add_dependency(%q<rails>, ["~> 3.0.0"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<render_component>, [">= 0"])
    s.add_dependency(%q<verification>, [">= 0"])
    s.add_dependency(%q<rails>, ["~> 3.0.0"])
  end
end
