ENV["RAILS_ENV"] = "test"
require File.expand_path( "../../config/environment", __FILE__ )
require "minitest/autorun"

Turn.config.format = :outline

def assert_false( block )
  assert_equal( block, false )
end