require 'sqlite3'

db = SQLite3::Database.new("dishes.db")

create_restaurant_table_cmd = <<-SQL_CMD
  CREATE TABLE restaurants(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255)
  )
 SQL_CMD

db.execute(create_restaurant_table_cmd)