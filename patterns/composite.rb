# 
# Below is an example of the Composite design pattern, which makes it easier to
# model objects that naturally group themselves into larger componenets. The
# whole looks a lot like one of the parts.

# Examples: Service Objects built from other Service Objects, FXRuby
# 

class Task
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def get_time_required
    0.0
  end
end

class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
  end

  def delete_sub_task(task)
    @sub_tasks.delete(task)
  end

  def get_time_required
    @sub_tasks.inject(0) { |task, time| time += task.get_time_required }
  end
end
