#
# Below is an example of the Observer design pattern, which makes it easy to
# build components that know about the activites of other components.
#
# Examples: ActiveRecord callbacks, PubSub
#

module Subject
  def initialize
    @observers = []
  end

  def add_observer(o)
    @observers << o
  end

  def remove_observer(o)
    @observers.delete(o)
  end

  def notify_observers
    @observers.each { |o| o.update(self) }
  end
end

class Employee
  include Subject

  attr_reader :name, :salary

  def initialize(ee_name, salary)
    super()  # Calls the module's `initialize` with no args
    @name = ee_name
    @salary = salary
  end

  def salary=(new_salary)
    old_salary = @salary
    @salary = new_salary
    notify_observers unless old_salary == @salary
  end
end

class Payroll
  def update(employee)
    puts "Payroll dept: #{employee.name} now makes $#{employee.salary}."
  end
end

class Spouse
  def update(employee)
    puts "Spouse: Now my spouse makes $#{employee.salary}."
  end
end

employee_of_the_month = Employee.new("Vijay", "10,000")
payroll_dept = Payroll.new
my_spouse = Spouse.new
employee_of_the_month.add_observer(payroll_dept)
employee_of_the_month.add_observer(my_spouse)
employee_of_the_month.salary = "15,000"
