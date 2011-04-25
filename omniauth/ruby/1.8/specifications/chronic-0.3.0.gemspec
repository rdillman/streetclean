# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{chronic}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tom Preston-Werner"]
  s.date = %q{2010-10-22}
  s.description = %q{Chronic is a natural language date/time parser written in pure Ruby.}
  s.email = %q{tom@mojombo.com}
  s.files = ["test/test_Chronic.rb", "test/test_DaylightSavings.rb", "test/test_Handler.rb", "test/test_Numerizer.rb", "test/test_RepeaterDayName.rb", "test/test_RepeaterFortnight.rb", "test/test_RepeaterHour.rb", "test/test_RepeaterMinute.rb", "test/test_RepeaterMonth.rb", "test/test_RepeaterMonthName.rb", "test/test_RepeaterTime.rb", "test/test_RepeaterWeek.rb", "test/test_RepeaterWeekday.rb", "test/test_RepeaterWeekend.rb", "test/test_RepeaterYear.rb", "test/test_Span.rb", "test/test_Time.rb", "test/test_Token.rb", "test/test_parsing.rb"]
  s.homepage = %q{http://github.com/mojombo/chronic}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{chronic}
  s.rubygems_version = %q{1.6.0}
  s.summary = %q{Natural language date/time parsing.}
  s.test_files = ["test/test_Chronic.rb", "test/test_DaylightSavings.rb", "test/test_Handler.rb", "test/test_Numerizer.rb", "test/test_RepeaterDayName.rb", "test/test_RepeaterFortnight.rb", "test/test_RepeaterHour.rb", "test/test_RepeaterMinute.rb", "test/test_RepeaterMonth.rb", "test/test_RepeaterMonthName.rb", "test/test_RepeaterTime.rb", "test/test_RepeaterWeek.rb", "test/test_RepeaterWeekday.rb", "test/test_RepeaterWeekend.rb", "test/test_RepeaterYear.rb", "test/test_Span.rb", "test/test_Time.rb", "test/test_Token.rb", "test/test_parsing.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 2

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
