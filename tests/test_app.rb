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

  def test_launch
    #create mock of TaskManager
    task_manager = MiniTest::Mock.new
    #create expectation for `run` method
    task_manager.expect :run, nil

    #stub and run
    TaskManager.stub :new, task_manager do
      @app.launch
    end

    #verify expectation
    task_manager.verify
  end
end
