require 'sqlite3'

db = SQLite3::Database.new("dishes.db")

create_restaurant_table_cmd = <<-SQL_CMD
  CREATE TABLE IF NOT EXISTS restaurants(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    location VARCHAR(255),
    phone VARCHAR(255),
    email VARCHAR(255),
    comments VARCHAR(255)
  )
 SQL_CMD

create_dish_table_cmd = <<-SQL_CMD
  CREATE TABLE IF NOT EXISTS dish(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    location INT,
    description VARCHAR(255),
    seasonal BOOLEAN,
    price VARCHAR(255),
    FOREIGN KEY(location) REFERENCES restaurant(name)
  )
SQL_CMD

create_review_table_cmd = <<-SQL_CMD
  CREATE TABLE IF NOT EXISTS review(
    id INTEGER PRIMARY KEY,
    stars INT,
    accurate_description BOOLEAN,
    consistent BOOLEAN,
    comments VARCHAR(255),
    user_id INT,
    dish_id INT
  )
SQL_CMD

create_user_table_cmd = <<-SQL_CMD
  CREATE TABLE IF NOT EXISTS user(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    user_name VARCHAR(255) UNIQUE
  )
SQL_CMD

db.execute(create_restaurant_table_cmd)

db.execute(create_dish_table_cmd)

db.execute(create_review_table_cmd)

db.execute(create_user_table_cmd)

def create_restaurant(db, name, location, phone, email, comments)
  db.execute("INSERT INTO restaurants (name, location, phone, email, comments) VALUES (?, ?, ?, ?, ?)", [name, location, phone, email, comments])
end

def create_dish(db, name, location, description, seasonal, price)
  db.execute("INSERT INTO dish (name, location, description, seasonal, price) VALUES (?, ?, ?, ?, ?)", [name, location, description, image, seasonal, price])
end

def create_review(db, stars, accuracy, consistency, comments, user_id, dish_id)
  db.execute("INSERT INTO review (stars, accurate_description, consistent, comments, user_id, dish_id) VALUES (?, ?, ?, ?, ?, ?)", [stars, accuracy, consistency, comments, user_id, dish_id])
end

def create_user(db, name, user_name)
  db.execute("INSERT INTO user (name, user_name) VALUES (?, ?)", [name, user_name])
end

def view_restaurant
  puts "What is the name of the restaurant you want to look up?"
  answer = gets.chomp!
  rest_info = db.execute("SELECT * FROM restaurants WHERE name=?", [answer])
  p rest_info
end

def view_user_info
  puts "What user name do you want to look up?"
  answer = gets.chomp!
  user_info = db.execute("SELECT (user.name, user.user_name, dish.name, review.stars, review.accurate_description, review.consistent, review.comments) FROM (user, review, dish) JOIN dish ON review.dish_id=dish_id JOIN review ON user.id=review.user_id WHERE user.user_name=?", [answer])
  puts "Name: #{user_info[0]}, Handle: #{user_info[1]}"
  user_info.each do |review|
    puts "Dish Name: #{review[dish[1]]},Stars: #{review[review[1]]}, Accuracy of description: #{review[review[2]]}, Consistency of Execution: #{review[review[3]]}, User Comments: #{review[review[4]]}"
  end 
end


def patron_signup(db)
  info_correct = false
  until info_correct
    puts "Ever get annoyed when that hole in the wall with amazing food only has 2 stars on Yelp?..\nEver wonder what the locals are eating?..\nAre you a constant over-orderer?\nSick of your friends winning the dinner order?\nCould you look at a menu all day wondering?\nSign up today! Dish about it.\nWhat's your name?"
    patron_name = gets.chomp!
    puts "What should your handle be?"
    user_handle = gets.chomp!
    puts "#{patron_name}\nHandle:#{user_handle}\nIs this correct?"
    correct = gets.chomp!
    if correct == "yes"
      create_user(db, patron_name, user_handle)
      info_correct = true 
    end
    valid_input = true 
  end 
end

def restaurant_signup(db)
  info_correct = false 
  until info_correct
    puts "Do you want to improve understanding with your customer base?\nNot sure your staff is adequately selling your specials?\nWant to know what's selling, and what people are saying about it?\nWondering if you should put that new special on the regular menu?\nSave time and turnover by including a more detailed description, an ingredient list, or even a nutrition   estimator!\nShare new specials or seasonal dishes from your page, straight  to your customers timeline!\nFor a small fee, we'll even send you your market data! Use it to find out if that new Chef de Cuisine is working out, what you sell (and should stock) the most of during what season, what could be perhaps phased out.\nSign up today! Start a conversation with your  customers, and listen to them dish about it.\nWhat's the name of your restaurant?"
    rest_name = gets.chomp!
    puts "Please enter the address"
    rest_address = gets.chomp!
    puts "Phone number?"
    rest_phone = gets.chomp!
    puts "Email?"
    rest_email = gets.chomp!
    puts "Please enter a short tagline/motto/descriptor for your place"
    rest_comments = gets.chomp!
    puts "#{rest_name}\n#{rest_address}\n#{rest_phone}\n#{rest_email}\n#{rest_comments}\nIs this correct?"
    correct = gets.chomp!
    if correct == "yes"
      create_restaurant(db, rest_name, rest_address, rest_phone, rest_email, rest_comments) 
      info_correct = true 
    end 
  end 
end 

def signup_who
  valid_input = false 
    until valid_input
    puts "Are you a patron, or a restaurant?"
    answer = gets.chomp!
    if answer == "patron"
      patron_signup
      valid_input = true 
    elsif answer == "restaurant"
      restaurant_signup
      valid_input = true 
    else
      puts "Sorry, I didn't understand you?"
    end 
  end 
end 

def login(db) 
  valid_input = false
  until valid_input
    puts "Are you a restaurant or a patron?"
    answer = gets.chomp!
    if answer == "restaurant"
      puts "What is the name of your restaurant?"
      name = gets.chomp!
      lookup = db.execute("SELECT restaurant.name FROM restaurants WHERE name=?", [name]) 
      if !lookup.empty?
      valid_input = true
      end 
    elsif answer == "patron"
      puts "What is your user name?"
      name = gets.chomp!
      lookup = db.execute("SELECT user.user_name FROM user WHERE user_name=?", [name])
      if !lookup.empty?
      valid_input = true
      end 
    else
      puts "#{name}? Are you sure this is correct? Try again"
    end 
  end 
  name
end 

def restaurant_name(db)
  valid_input = false
  until valid_input
    puts "What is the name of the restaurant?"
    name = gets.chomp!
    # add code to calculate if restaurant is included in table, if not add
    exsisting_rest = rest_exists(name) # search for restaurant.name
    # print info for restaurant if listed
    if exsisting_rest.empty?
      exsisting_rest = patron_add_rest_info#(db)
    else
      puts "#{name}"
      puts "Is this correct?"
      correct = gets.chomp!
      if correct == "yes"
        valid_input = true
      end 
    end 
  end 
  exsisting_rest
end 

def rest_exists(name)
  db.execute("SELECT * FROM restaurants WHERE name=?", [name])
end 

def patron_add_rest_info(db)
  info_correct = false 
  until info_correct
    puts "Please fill out what you can about where you're eating. If you don't want to answer, just press 'enter':\nWhat's the name of the restaurant?"
    rest_name = gets.chomp!
    puts "Please enter the address"
    rest_address = gets.chomp!
    puts "Phone number?"
    rest_phone = gets.chomp!
    puts "Email?"
    rest_email = gets.chomp!
    puts "Please enter a short tagline/motto/descriptor for your place"
    rest_comments = gets.chomp!
    puts "#{rest_name}\n#{rest_address}\n#{rest_phone}\n#{rest_email}\n#{rest_comments}\nIs this correct?"
    correct = gets.chomp!
    if correct == "yes"
      create_restaurant(db, rest_name, rest_address, rest_phone, rest_email, rest_comments) 
      info_correct = true 
    end 
  end 
  db.execute("SELECT (id) FROM restaurants WHERE (name=?)", [rest_name])
end 

def current_dishes(rest_name)
  db.execute("SELECT (name, comments, seasonal, price) FROM dishes JOIN restaurants ON dishes.location=restaurant.id WHERE restaurant.name=?", [rest_name])
end 

def add_or_update(rest_name)
  current_dishes(rest_name)
  valid_input = false 
  puts "Would you like to add or update?"
  answer = gets.chomp!
  until valid_input
    if answer == "add"
      dish_creator
      valid_input = true 
    elsif answer == "update"
      # run update module
      valid_input = true 
    end 
  end 
end 

def add_dish_name
  valid_input = false
  until valid_input
    puts "What is the name of the dish you'd like to add?"
    dish_name = gets.chomp!
    puts "#{dish_name}, correct?"
    answer = gets.chomp!
      if answer == "yes"
        valid_input = true 
      end 
  end
  dish_name
end 
  
def add_dish_seasonal
  valid_input = false 
  until valid_input
    puts "Is this dish seasonal?"
    answer = gets.chomp!
    if answer == "yes"
      dish_seasonal = true
      valid_input = true 
    elsif answer == "no"
      dish_seasonal = false
      valid_input = true 
    else 
      puts "Please answer yes or no.."
    end 
  end 
  dish_seasonal
end

def add_dish_price
  valid_input = false 
  until valid_input
    puts "How much does this dish cost?"
    cost = gets.chomp!
    puts "It costs #{cost}?"
    answer = gets.chomp!
    if answer == "yes"
      valid_input = true
    else 
      puts "Please answer 'yes' or the correct price.."
    end 
  end 
  cost
end 

def add_dish_comment
  valid_input = false
  until valid_input
    puts "Please add any comments or descriptors for your dish"
    descriptor = gets.chomp!
    puts "Here's what I have: \n#{descriptor}\nIs this correct?"
    answer = gets.chomp!
    if answer == "yes"
      valid_input = true 
    else 
      puts "Sorry, go ahead a reenter.."
    end 
  end 
  descriptor
end 

def dish_creator
  dish_location = restaurant_name
  new_dish_name = add_dish_name
  seasonal_yaynay = add_dish_seasonal
  dish_cost = add_dish_price
  dish_description = add_dish_comment
  create_dish(db, new_dish_name, dish_location, dish_description, seasonal_yaynay, dish_cost)
end 

puts "Hello and Welcome to Dish!"
yayornay = false

until yayornay
  puts "The app that allows you to share where and what you're eating, and rate it too!\n Are you new to Dish?"
  new_or_no = gets.chomp!
  if new_or_no == "yes"
    signup_who
    yayornay = true 
  elsif new_or_no == "no"
    login(db)
    yayornay = true
  else
    puts "Sorry, I didn't understand"
  end 
end 


login_name = login 
