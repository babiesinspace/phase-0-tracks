#Get Client Info: name, age, children, decor theme, favorite season, themes or colors they hate, favorite precious stone 
#For each client input value, assign a key and appropriate data type
#Print info for client to check 
#Ask client if input is correct
#If changes = none, move forward
#If client needs to make changes, redo form 
#Print updated version 

client_info = ["name", "age", "amount_children", "decor_theme", "favorite_season", "themes_or_colors_hated", "favorite_precious_stone"]

puts "Please enter a value for each item. For items with multiple answers, please separate with a comma."

form = client_info.map{|question, imput|
    puts question + "?"
    imput = gets.chomp!
    [question, imput]}.to_h
  
p form

puts "Do you need to change something? If not, enter 'no'. If you do, enter 'yes'."
answer = gets.chomp!

if answer == "no"
  puts "Thank You!"
else 
  client_info = ["name", "age", "amount_children", "decor_theme", "favorite_season", "themes_or_colors_hated", "favorite_precious_stone"]

  puts "Please enter a value for each item. For items with multiple answers, please separate with a comma."
  
  form = client_info.map{|question, imput|
      puts question + "?"
      imput = gets.chomp!
      [question, imput]}.to_h
    
  p form
end 