require_relative 'task_manager'

class App
  attr_accessor :welcome_message

  def initialize
    @welcome_message = "Welcome to the TaskMaster App!"
  end

  def launch
    taskmaster_app = TaskManager.new
    puts @welcome_message
    taskmaster_app.run
  end

end
