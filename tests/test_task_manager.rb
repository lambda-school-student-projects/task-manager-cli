require 'minitest/autorun'
require_relative '../task_manager'

class TestTaskManager < MiniTest::Test

  def setup
    @task_manager = TaskManager.new
  end

  def test_initialize
    assert @task_manager
    assert_equal [], @task_manager.tasks
  end


end
