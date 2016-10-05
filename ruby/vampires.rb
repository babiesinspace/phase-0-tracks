wolves_like_sunshine = true
wolves_like_garlic = true
vampires_like_sunshine = false
vampires_like_garlic = false
current_year = 2016

puts "What's your name?"

candidate_name = gets.chomp


if (candidate_name == "Drake Cula") || (candidate_name == "Tu Fang")
  candidate_name = false
end

puts "How old are you?"

age_in_years = gets.chomp.to_i

puts "What year were you born?"

year_of_birth = gets.chomp.to_i


if age_in_years == current_year - year_of_birth
  age_in_years = true
else 
  age_in_years = false
end


puts "Our company cafeteria serves garlic bread. Should we order some for you?"

garlic_good = gets.chomp
invalid_input = true

while invalid_input
  if garlic_good == "yes"
    invalid_input = false
    garlic_good = true
    puts "Let's get you some!"
  elsif garlic_good == "no"
    invalid_input = false
    garlic_good = false
    puts "Oh, that's too bad.."
  else
    puts "please just answer 'yes' or 'no'."
    puts "Our company cafeteria serves garlic bread. Should we order some for you?"
    garlic_good = gets.chomp
  end
end

puts "Would you like to enroll in the company's health insurance?"

health_conscious = gets.chomp
invalid_input = true

while invalid_input
  if health_conscious == "yes"
    invalid_input = false
    health_conscious = true
    puts "Let's sign you up!"
  elsif health_conscious == "no"
    invalid_input = false
    health_conscious = false
    puts "I guess you don't worry about getting sick.."
  else
    puts "please just answer 'yes' or 'no'."
    puts "Would you like to enroll in the company's health insurance?"
    health_conscious = gets.chomp
  end
end

if candidate_name == false 
  puts "Definitely a vampire"
elsif !age_in_years && !garlic_good && !health_conscious
  puts "Almost certainly a vampire."
elsif age_in_years && (garlic_good || health_conscious)
  puts "Probably not a vampire."
elsif (!age_in_years && !garlic_good) || !health_conscious
  puts "Probably a vampire"
else
  puts "Results inconclusive"
end

