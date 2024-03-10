require 'minitest/autorun'
require_relative '../task'

class TestTask < MiniTest::Test
  def setup
  end

  def test_create_task
    task = Task.new("Buy clothing", "05-05-2000", "Incomplete")
    assert_equal "Buy clothing", task.name
    assert_equal "05-05-2000", task.due_date
    assert_equal "Incomplete", task.status
  end

  def test_update_task_name
    task = Task.new("Buy clothing", "05-05-2000", "Incomplete")
    new_task_name = "Clean the litter box"
    task.name = new_task_name

    assert_equal new_task_name, task.name
  end

  def test_update_task_due_date
    
  end

  def test_update_task_status
  end

end
