require 'rake'
require 'rake/testtask'
require 'jeweler'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test activemerchant_alipay.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

Jeweler::Tasks.new do |gemspec|
  gemspec.name = "activemerchant_alipay"
  gemspec.summary = "Activemerchant integration for Alipay"
  gemspec.description = "Activemerchant patch for china online payment platform alipay"
  gemspec.email = "ochkoo@gmail.com"
  gemspec.homepage = "http://github.com/ochko/activemerchant_alipay"
  gemspec.authors = ["Lkhagva Ochirkhuyag"]
  gemspec.add_dependency 'activemerchant', '>= 1.20.0'
end
Jeweler::GemcutterTasks.new
