require 'minitest/autorun'
require_relative '../task'

class TestTask < Minitest::Test
  def setup
    @task = Task.new("Buy clothing", "05-05-2000", "Incomplete")
  end

  def test_initialize
    assert_equal "Buy clothing", @task.name
    assert_equal "05-05-2000", @task.due_date
    assert_equal "Incomplete", @task.status
  end

  def test_update_accessor_name
    new_task_name = "Clean the litter box"
    @task.name = new_task_name

    assert_equal new_task_name, @task.name
  end

  def test_update_accessor_due_date
    new_task_due_date = "10-31-2024"
    @task.due_date = new_task_due_date

    assert_equal new_task_due_date, @task.due_date
  end

  def test_update_accessor_status
    new_task_status = "Completed"
    @task.status = new_task_status

    assert_equal new_task_status, @task.status
  end

end
