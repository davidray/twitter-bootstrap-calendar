#!/usr/bin/env rake
require 'bundler'
Bundler::GemHelper.install_tasks

desc "Bundle the gem"
task :bundle do
  sh('bundle install')
  sh 'gem build *.gemspec'
  sh 'gem install *.gem'
  sh 'rm *.gem'
end

task(:default).clear
task :default => :bundle

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end