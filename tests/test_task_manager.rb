require 'minitest/autorun'
require_relative '../task_manager'

class TestTaskManager < Minitest::Test

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
    task = Task.new('Buy cat food', '03-13-2024', 'Incomplete')
    @task_manager.tasks << task
    input = StringIO.new("Buy cat food\n03-15-2024\n")
    @task_manager.update_task(input)

    assert_equal '03-15-2024', task.due_date
  end

  def test_remove_task
    task = Task.new('Buy cat food', '03-13-2024', 'Incomplete')
    @task_manager.tasks << task
    input = StringIO.new("Buy cat food\n")
    @task_manager.remove_task(input)

    assert_equal [], @task_manager.tasks
  end

  def test_display_tasks
    task_1 = Task.new('Buy cat food', '03-13-2024', 'Incomplete')
    task_2 = Task.new('Buy cat litter', '03-15-2024', 'Incomplete')
    @task_manager.tasks << task_1 << task_2

    output = StringIO.new
    $stdout = output
    @task_manager.display_tasks
    
    expected_output = <<~OUTPUT
        Tasks:
        Task Name: Buy cat food
        Due Date: 03-13-2024
        Status: Incomplete
        ------------------------
        Task Name: Buy cat litter
        Due Date: 03-15-2024
        Status: Incomplete
        ------------------------
    OUTPUT
    
    assert_equal expected_output, output.string
  ensure
    $stdout = STDOUT
  end

  def test_run
    input = StringIO.new("add\nBuy cat food\n03-13-2024\ndisplay\nexit\n")
    output = StringIO.new
    $stdout = output

    @task_manager.run(input)

    expected_output = <<~OUTPUT
      What would you like to do? (add/update/remove/display/exit)
      Enter task name:
      Enter due date:
      Task added!
      What would you like to do? (add/update/remove/display/exit)
      Tasks:
      Task Name: Buy cat food
      Due Date: 03-13-2024
      Status: Incomplete
      ------------------------
      What would you like to do? (add/update/remove/display/exit)
      Thank you for using the TaskMaster app!
    OUTPUT

    assert_equal expected_output, output.string
  ensure
    $stdout = STDOUT
  end

end
