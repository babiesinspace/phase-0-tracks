puts "What is the hamster's name? If no name given, I'll make on up!"

hamster_name = gets.chomp

 if hamster_name.length == 0
    hamster_name = "Sam"
    puts "Let's name it Sam!"
    puts "Hello, #{hamster_name}!"
 else
   puts "Hello, #{hamster_name}!"
 end


puts "How noisy is #{hamster_name}? Please answer from 1-10, with 10 being the most noisy."

squeky_level = gets.chomp

until (squeky_level.to_i >= 1) && (squeky_level.to_i <= 10)
    puts "I'm sorry, that's not a valid level. Try again!"
    squeky_level = gets.chomp
end

puts "What color #{hamster_name}'s fur? Brown, Black, White, Mixed, or Other?"

fur_color = gets.chomp

until (fur_color == "Brown") || (fur_color == "Black") || (fur_color == "White") || (fur_color == "Mixed") || (fur_color == "Other")
      puts "Not a valid color!"
      puts "What color 's fur? Brown, Black, White, Mixed, or Other?"
      fur_color = gets.chomp
end

puts "Is #{hamster_name} a good candidate for adoption? (yes/no)"

candidacy = gets.chomp

valid_input = false

until valid_input == true
  if candidacy == "yes"
    valid_input = true
    puts "Lovely! Let's find him a home!"
  elsif candidacy == "no"
    valid_input = true
    puts "Well I'm sure he'd say he has an excellent temperament, the best even."
  else
    puts "please just answer 'yes' or 'no'."
    puts "Is #{hamster_name} a good candidate for adoption? (yes/no)"
    candidacy = gets.chomp
  end
end
    

puts "How old is #{hamster_name}? If you don't know, just skip it!"

hamster_age = gets.chomp
valid_input = false

until valid_input == true
  if hamster_age.empty?
      valid_input = true
      puts "I wish I didn't know my age too! We'll just tell everyone it's not their business"
      hamster_age = "(not your business!)"
  elsif hamster_age.to_i.to_s == hamster_age
    valid_input = true
    puts "Wow, #{hamster_age.to_i}!"
  else
    puts "Age ain't nothing but a number, but please enter a valid one!"
    puts "How old is #{hamster_name}?"
    hamster_age = gets.chomp
  end
 end 

puts "OK! So this is, #{hamster_name}. A #{hamster_age} year old #{fur_color} hamster who's about a #{squeky_level} on the Squeak-Scale. Adoptable? #{candidacy}. And we love em for it! ..Is this all correct? (yes or no)"

correct = gets.chomp

valid_input = false

until valid_input == true
  if correct == "yes"
    valid_input = true
    puts "Huzzah!"
  elsif correct == "no"
    valid_input = true
    puts "Please start the form again."
  else
    puts "please just answer 'yes' or 'no'."
    puts "Is this correct? (yes/no)"
    correct = gets.chomp
  end
end