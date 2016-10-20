# Quantity of items defauts to 1

#  Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Create empty hash 
  # split string of items (creates array)
  # fill empty hash with each element of the array being the keys
  # set default quantity to 1 (values)
  # print the list to the console [can you use one of your other methods here?]
# output: Hash = {item => 1}


def create_list(item_string)
  item_list = item_string.split
  list = item_list.map do |item|
    quantity = 1
    [item, quantity]
  end 
list.to_h 
end 

grocery_list = create_list("carrots apples cereal pizza")
puts grocery_list

# Method to add an item to a list
# input: (hash name, item name , optional quantity)
# steps: hash name .push item name, optional quantity 
# output: p hash name 

def add_food(grocery_list, item, quantity)
  grocery_list[item] = quantity
  grocery_list
end 

grocery_list = add_food(grocery_list, "milk", 1)
  
puts grocery_list

# Method to remove an item from the list
# input: (hash name, item name)
# steps: find out if hash name includes item name 
#   if so, delete item (delete_if key == item name)
# return hash name 
# output: p hash 

def remove_food(list, item)
  list.delete(item)
  p list
end 

grocery_list = remove_food(grocery_list, "milk")

# Method to update the quantity of an item
# input: hash name, item name, new quantity  
# steps: hash name[item name] = new quantity 
# output: p hash 

def update_quantity(list, item, new_quantity)
  list[item] = new_quantity
  list
end

grocery_list = update_quantity(grocery_list, "apples", 4)


# Method to print a list and make it look pretty
# input: hash name 
# steps: hash name .each |item, quantity|
#      puts "You need #{quantity} #{item}"
# output: List on seperate lines 


def pretty_list(list)
  list.each do |item, quantity|
    puts "You need #{quantity} #{item}"
  end
end

pretty_list(grocery_list)
