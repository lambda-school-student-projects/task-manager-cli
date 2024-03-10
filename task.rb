class Task
  attr_accessor :name, :due_date, :status

  def initialize(name, due_date, status)
    @name = name
    @due_date = due_date
    @status = status
  end
end
