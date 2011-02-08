require 'rake'
require 'rake/testtask'
require 'rake/gempackagetask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the browser_profiler plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

gem_spec = Gem::Specification.new do |s|
    s.platform  =   Gem::Platform::RUBY
    s.name      =   "browser_profiler"
    s.version   =   "1.3.0"
    s.author    =   "Bart ten Brinke"
    s.email     =   "bart@railsdoctors.com"
    s.summary   =   "Browser-side profiler"
    s.files     =   FileList["lib/**/*"].to_a
    s.require_path  =   "lib"
    s.test_files = Dir.glob('test/**/*_test.rb')
    s.has_rdoc  =   false
    s.extra_rdoc_files  =   ["README"]
    s.add_dependency('ruby-prof', '>= 0.4.0')
end

gem = Rake::GemPackageTask.new(gem_spec) do |pkg|
  pkg.need_tar = true
  pkg.need_zip = true
end

desc 'Generate documentation for the browser_profiler plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'BrowserProfiler'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
