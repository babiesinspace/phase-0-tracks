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
    image_file VARCHAR(255),
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
    user_name VARCHAR(255)
  )
SQL_CMD

db.execute(create_restaurant_table_cmd)

db.execute(create_dish_table_cmd)

db.execute(create_review_table_cmd)

db.execute(create_user_table_cmd)

def create_restaurant(db, name, location, phone, email, comments)
  db.execute("INSERT INTO restaurants (name, location, phone, email, comments) VALUES (?, ?, ?, ?, ?)", [name, location, phone, email, comments])
end

def create_dish(db, name, location, description, image, seasonal, price)
  db.execute("INSERT INTO dish (name, location, description, image_file, seasonal, price) VALUES (?, ?, ?, ?, ?, ?)", [name, location, description, image, seasonal, price])
end

def create_review(db, stars, accuracy, consistency, comments, user_id, dish_id)
  db.execute("INSERT INTO review (stars, accurate_description, consistent, comments, user_id, dish_id) VALUES (?, ?, ?, ?, ?, ?)", [stars, accuracy, consistency, comments, user_id, dish_id])
end

def create_user(db, name, user_name)
  db.execute("INSERT INTO user (name, user_name) VALUES (?, ?)", [name, user_name])
end