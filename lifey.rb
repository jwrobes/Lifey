class Life
  
  attr_accessor :hours, :unconfirmed, :confirmed

  def initialize(name)
    @name = name
    @hours = 6


    @confirmed = Plans.new
    @unconfirmed = Plans.new

  end

  def start
    sleep = Plan.new("Sleep", 5, "Sleep")
    code = Plan.new("Code", 3, "Code")
    @unconfirmed.add(sleep)
    @unconfirmed.add(code)
  end
  
  def confirm(plan_name)
    if plan_name == "Ragequit" || plan_name == "Quit" || plan_name == "Exit"
      exit = true
      abort("RAGEQUIT")
    elsif plan = @unconfirmed.plans.select{|unconfirmed_plan| unconfirmed_plan.name == plan_name}[0] #if life.unconfirmed.plans.include?(plan)
      @hours -= plan.cost
    #moves plan from unconfirmed to confirmed
      plan = @unconfirmed.remove(plan)
      @confirmed.add(plan)
    else
      puts "You've got to type the precise name of one of these plans, my dear."
      sleep(3.5)
  end
  
  def check
    #did you plan enough sleep, eat, etc? 
  end
end

class Plans

  attr_accessor :plans

  def initialize
    @plans = []
  end

  def list
    @plans.each_with_index do |plan, index|
      print "#{index + 1}. "
      plan.display
    end#each
  end#list

  def add(plan)
    @plans.push(plan)
  end

  def remove(plan)
    @plans.delete(plan)
  end
end#Plans

class Plan
  attr_accessor :name, :cost, :category

  def initialize(name, cost, category)
    @name = name
    @cost = cost
    @category = category
  end

  def display
    puts "-----------"
    puts "Name: #{@name}"
    puts "--------------"
    puts "Takes #{cost} hours"
    puts "Category: #{category}"
  end

end
end

####DRIVER CODE#####

puts "Hello there, what's your name?"
name = gets.chomp
puts "Hi #{name}. Welcome to DevBootCamp! I'm Lifey."
sleep(2)
puts "I'll help you train yourself to fit all the important parts of a human life into a day at DBC."
sleep(3)
puts "Let's get started! Good luck ;D "

exit = false

until exit 
  puts "Press Enter to begin."
  gets

  life = Life.new(name)
  life.start

  while life.hours > 0
    puts
    puts "Here are all your remaining plans for today, and how long they take."

    life.unconfirmed.list
    
    puts
    puts "You have #{life.hours} hours remaining."
    puts "What would you like to do?"
    plan = gets.chomp.capitalize
        life.confirm(plan)
    puts
  end

  puts "Oops! You ran out of time."
  puts "You won't make it through DevBootCamp alive with that level of life skill. Better try again."
end