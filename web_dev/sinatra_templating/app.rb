# require gems
require 'sinatra'
require 'sqlite3'
require "sinatra/reloader" if development?

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

get '/delete_student' do
	erb :delete_student
end

# create new students via
# a form
post '/students' do
  p params
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

post '/delete' do
	p params
	db.execute("DELETE FROM students where name=?", [params['name']])
	redirect '/'
end

# add static resources