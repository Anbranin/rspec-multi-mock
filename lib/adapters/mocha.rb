require 'rubygems'
require 'mocha/object'
require 'mocha/api'

# The following begin/rescue block idea was taken from 
# rspec/core/mocking_adapters/mocha.rb

begin
  require 'mocha/api'
  
  begin
    require 'mocha/object'
  rescue LoadError
  end
rescue LoadError
  require 'mocha/standalone'
  require 'mocha/object'
end

module MultiMock
  module Adapters
    class Mocha
      include ::Mocha::API

      alias :setup_mocks_for_rspec :mocha_setup
      alias :verify_mocks_for_rspec :mocha_verify
      alias :teardown_mocks_for_rspec :mocha_teardown
    end
  end
end
