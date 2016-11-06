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
    price VARCHAR(255)
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

restaurant_signup(db)