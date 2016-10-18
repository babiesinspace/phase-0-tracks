class Santa
  attr_reader :age, :ethnicity
  attr_accessor :gender
  
  def greet
    puts "Ho, ho, ho! Haaaappy holidays!"
  end
  
  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end 
  
  def initialize(gender, ethnicity)
    @gender = gender
    @ethnicity = ethnicity
    @age = rand(0..140) 
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    puts "Initializing Santa instance ..."
  end 
  
  def celebrate_birthday
    @age = @age + 1
  end
  
  def get_mad_at(reindeer)
    @reindeer_ranking.each do |deer|
      if deer == reindeer
        @reindeer_ranking.delete(deer)
        @reindeer_ranking << reindeer
      end
    end 
  end

end

drunk_santas = []
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]


10.times{drunk_santas << Santa.new(example_genders.sample, example_ethnicities.sample)}
p drunk_santas[0].gender 
p drunk_santas[0].age 
p drunk_santas[0].ethnicity 
