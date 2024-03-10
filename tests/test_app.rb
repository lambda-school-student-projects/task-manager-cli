require 'minitest/autorun'
require_relative '../app'

class AppTest < MiniTest::Test
  def setup
    @app = App.new
  end

  def test_initialize
    assert @app
    assert_equal "Welcome to the TaskMaster App!", @app.welcome_message
  end
end
