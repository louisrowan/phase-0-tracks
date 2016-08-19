# require gems
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sqlite3'
require 'Faker'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# Contact Route
get '/contact' do
  address = Faker::Address.street_address + ', ' + Faker::Address.city
  "I live at #{address}."
end

# Great job routes
get '/great_job/:name' do
    "Good job, #{params[:name]}"
end

get '/great_job' do
  "Good job!"
end

# Add together
get '/add/:num1/:num2' do
  sum = params[:num1].to_i + params[:num2].to_i
  "#{params[:num1]} + #{params[:num2]} = #{sum.to_s}"
end

# Only shows those in specified location
get '/location/:location' do
  students = db.execute("select * from students where campus='#{params[:location].upcase}'")
  students.to_s
end