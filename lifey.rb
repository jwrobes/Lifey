class Life
  
  attr_accessor :hours, :unconfirmed, :confirmed

  def initialize(name)
    @name = name
    @hours = 6


    @confirmed = Plans.new
    @unconfirmed = Plans.new

  end

  def start
    sleep = Plan.new("Full night's sleep", 8, "Sleep")
    code = Plan.new("Code", 3, "Code")
    @unconfirmed.add(sleep)
  end
  
  def confirm(plan_name)
    if plan_name == "exit"
      abort("Exiting loop")
    elsif plan = @unconfirmed.plans.select{|unconfirmed_plan| unconfirmed_plan.name == plan_name}[0] #if life.unconfirmed.plans.include?(plan)
      time.hours -= plan.cost
    #moves plan from unconfirmed to confirmed
      plan = @unconfirmed.remove(plan)
      @confirmed.add(plan)
    else
      puts "You've got to type the precise name of one of these plans, my dear."
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
    @plans.each do |plan|
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
    puts "#{@name}"
    puts "Takes #{cost} hours"
    puts "Category: #{category}"
  end

end
end

####DRIVER CODE#####

puts "Hello there, what's your name?"
name = gets.chomp
puts "Hi #{name}. Welcome to DevBootCamp! I'm Lifey."
puts "I'll help you train yourself to fit all the important parts of a human life into a day at DBC."
puts "Let's get started! Good luck ;D "

life = Life.new(name)
life.start

while life.hours > 0
  puts "Here are all your remaining plans for today, and how long they take."
  life.unconfirmed.list

  puts "You have #{life.hours} hours remaining."
  puts "What would you like to do?"
  plan = gets.chomp
    
      life.confirm(plan)
  puts
end