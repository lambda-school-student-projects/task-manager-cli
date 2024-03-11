require_relative 'task'

class TaskManager
  attr_reader :tasks

  def initialize
    @tasks = []
  end

  def add_task(input)
    puts "Enter task name:"
    task_name = input.gets&.chomp
    puts "Enter due date:"
    task_due_date = input.gets&.chomp
    task_status = "Incomplete"

    new_task = Task.new(task_name, task_due_date, task_status)
    @tasks << new_task
    puts "Task added!"
  end

  def update_task(input)
    puts "Enter name of task to edit:"
    task_name = input.gets&.chomp

    task_to_edit = @tasks.find { |task| task.name == task_name }
    
    if task_to_edit
      puts "Enter due date:"
      new_due_date = input.gets&.chomp
      task_to_edit.due_date = new_due_date
      puts "Task updated successfully!"
    else
      puts "Task not found!"
    end
  end

  def remove_task(input)
    puts "Enter name of task to remove:"
    task_name = input.gets&.chomp

    task_to_remove = @tasks.find { |task| task.name == task_name }
    
    if task_to_remove
      @tasks.delete(task_to_remove)
      puts "Task updated successfully!"
    else
      puts "Task not found!"
    end
  end

  def run
  end
end
