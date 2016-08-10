# OPERATION KITTEN EXPLOSION!

# talk about Object Relational Mapping (ORM)

# require gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
db = SQLite3::Database.new("kittens.db")
db.results_as_hash = true

# learn about fancy string delimiters
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS kittens(
    id INTEGER PRIMARY KEY,
    name VARCHAR(255),
    age INT
  )
SQL

# create a kittens table (if it's not there already)
db.execute(create_table_cmd)

# add a test kitten
# db.execute("INSERT INTO kittens (name, age) VALUES ('Bob', 10)")

# add LOOOOTS of kittens!
# so. many. kittens. 
#KittenExplosion
def create_kitten(db, name, address, age)
  db.execute("INSERT INTO kittens (name, address, age) VALUES (?, ?, ?)", [name, address, age])
end

def delete_kitten(db)
	db.execute('delete from kittens where address = 0')
end

def age_one_year(db)
	db.execute('update kittens set age=(age + 1)')
end

age_one_year(db)

delete_kitten(db)

# db.execute('alter table kittens add column address VARCHAR(255)')



counter = 0
50.times do
  create_kitten(db, Faker::Name.name, Faker::Address.street_address, 0)
  puts counter
  counter += 1
end

# explore ORM by retrieving data
kittens = db.execute("SELECT * FROM kittens")
kittens.each do |kitten|
 puts "#{kitten['name']} is #{kitten['age']} and they live at #{kitten['address']}"
end


