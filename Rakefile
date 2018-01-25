require "bundler/gem_tasks"
require "rake/testtask"
require 'rubygems/package_task'

spec = eval(File.read('retinator.gemspec'))
Gem::PackageTask.new(spec) do |pkg|
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

task :default => :test
