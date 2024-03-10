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

  def test_add_task
  input = StringIO.new("Buy cat food\n03-13-2024\n")
  @task_manager.add_task(input)
  assert_equal 1, @task_manager.tasks.length
  
  task = @task_manager.tasks.first
  assert_equal 'Buy cat food', task.name
  assert_equal '03-13-2024', task.due_date
  assert_equal 'Incomplete', task.status

  end

  def test_update_task
  end

  def test_remove_task
  end

  def test_display_tasks
  end

  def test_run
  end

end
