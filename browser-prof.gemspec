Gem::Specification.new do |s|
  s.name    = "browser-prof"

  # Do not set the version and date field manually, this is done by the release script
  s.version = "1.2.6"
  s.date    = "2011-06-24"

  s.summary     = "Rails tool to to profile single requests using ruby-prof."
  s.description = <<-eos
    This is a simple tool to profile single web requests in Rails using the power or ruby-prof.
  eos

  s.rdoc_options << '--title' << s.name << '--main' << 'README.rdoc' << '--line-numbers' << '--inline-source'
  s.extra_rdoc_files = ['README.rdoc']

  s.requirements << "ruby-prof gem is required."

  s.add_dependency('ruby-prof')
  s.add_development_dependency('rake')
  s.add_development_dependency('rails', '2.3.2')
  if defined?(JRUBY_VERSION)
    s.add_development_dependency('jdbc-sqlite3')
  else
    s.add_development_dependency('sqlite3')
  end

  s.authors  = ['Bart ten Brinke']
  s.email    = ['bart@railsdoctors.com']
  s.homepage = 'http://railsdoctors.com'

  # The files and test_files directives are set automatically by the release script.
  # Do not change them by hand, but make sure to add the files to the git repository.
  s.files      = %w(.gitignore MIT-LICENSE README.rdoc Rakefile browser-prof.gemspec init.rb lib/browser-prof.rb lib/ruby-prof/graph_html_printer_enhanced.rb lib/ruby-prof/template.rhtml tasks/github-gem.rake test/functional/slow_controller_test.rb test/test_helper.rb)
  s.test_files = %w(test/functional/slow_controller_test.rb)
end
