$: << File.join(File.dirname(__FILE__), '..', 'lib')
$: << File.dirname(__FILE__)

require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  require 'rspec'

  # Requires supporting files with custom matchers and macros, etc,
  # in ./support/ and its subdirectories.
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}
end

Spork.each_run do
  require 'the_gambler'
end

RSpec.configure do |config|
end
