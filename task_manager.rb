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

  def display_tasks
    puts "Tasks:"
    @tasks.each do |task|
      puts "Task Name: #{task.name}"
      puts "Due Date: #{task.due_date}"
      puts "Status: #{task.status}"
      puts "------------------------"
    end
  end
  
  def run(input = $stdin)
    loop do
      puts "What would you like to do? (add/update/remove/display/exit)"
      selection = input.gets&.chomp.downcase

      case selection
      when "add"
        add_task(input)
      when "update"
        update_task(input)
      when "remove"
        remove_task(input)
      when "display"
        display_tasks
      when "exit"
        puts "Thank you for using the TaskMaster app!"
        break
      else
        puts "Invalid choice. Please try again."
      end
    end
  end
end
