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

  def run
  
  end
end
