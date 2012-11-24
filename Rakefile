# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "the_gambler"
  gem.homepage = "http://github.com/mstahl/the_gambler"
  gem.license = "MIT"
  gem.summary = %Q{Classes and modules for card-playing apps.}
  gem.description = %Q{
    Really common tasks in programs that use playing cards are a pain to implement. This is my
    implementation. Use it. Or don't.
  }
  gem.email = "max@villainousindustries.com"
  gem.authors = ["max thom stahl"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new

namespace :benchmark do
  require 'the_gambler'

  desc 'Test how long it takes to evaluate a given number of random hands.'
  task :randoms do
    10_000_000.times do |i|
      TheGambler::Hand.new(rand(52), rand(52), rand(52), rand(52), rand(52)).poker_value
    end
  end
end

