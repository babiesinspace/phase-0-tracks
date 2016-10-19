#module Shout
#  def self.yell_angrily(words)
#    words + "!!!" + " :("
#  end

#  def self.yelling_happily(words)
#    words + "?!!" + " YES! :)"
#  end 

#end

#Shout.yell_angrily("Why")

#Shout.yelling_happily("Because I'm building character")

module Shout
  def political(futile_choice)
    puts "You can't choose " + futile_choice + ", that's INSANE!"
  end 
  
  def rant(topic)
    puts "I NEVER write diatribe on Facebook. But I feel it is my DUTY to talk about my feelings on " + topic + ". " + topic.upcase + " IS ... (continue reading)"
  end 
end

class Conservative_Douche
  include Shout
end

class Liberal_Turd
  include Shout
end 


paul_ryan = Conservative_Douche.new 
paul_ryan.political("anyone")

acquaintance = Liberal_Turd.new 
acquaintance.rant("the current political atmosphere")

