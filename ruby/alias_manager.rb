answer = nil 
spy_name_database = []

until answer == "quit"

puts "What's your first name?"

real_first_name = gets.chomp!



puts "What's your last name?"

real_last_name = gets.chomp!

real_full_name = real_first_name + " " + real_last_name


spy_name_database << real_full_name


first_name = real_first_name.downcase.split('')
last_name = real_last_name.downcase.split('')

vowel = ["a", "e", "i", "o", "u"]
consonant = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]

first_name.map! {|letter|
  if vowel.include?(letter)
    vowel.rotate(1)[vowel.index(letter)]
  elsif consonant.include?(letter)
    consonant.rotate(1)[consonant.index(letter)]
  else
    p letter
  end 
}


last_name.map! {|letter|
  if vowel.include?(letter)
    vowel.rotate(1)[vowel.index(letter)]
  elsif consonant.include?(letter)
    consonant.rotate(1)[consonant.index(letter)]
  else
    p letter
  end 
}

first_name.first.upcase!
last_name.first.upcase!

spy_name = last_name.join + " " + first_name.join 


spy_name_database << spy_name

puts "Your spy name is #{spy_name}"
puts "Push enter to add another name, or 'quit' to exit."
answer = gets.chomp
end


h = Hash[*spy_name_database]

puts "Spy Name Database:"
p h 


#Get name from User 
#Split by word
#Downcase name 
#For each word:
#Split by character
#Swap first and last name 

#Select all vowels 
#For each vowel, switch them with next vowel in sequence
#Map it 
#Do same for each consonant
#Join characters to reform word
#Join words to for name 
#Upcase each word 

#Return spy name 
