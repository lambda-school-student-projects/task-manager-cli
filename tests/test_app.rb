require 'minitest/autorun'
require_relative '../app'

class AppTest < MiniTest::Test
  def setup
    @app = App.new
  end

  def test_initialize
  end
end
