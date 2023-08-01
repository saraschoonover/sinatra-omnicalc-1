require "sinatra"
require "sinatra/reloader"

get("/") do
 erb(:layout)
end

get("/square/new") do
  erb(:square_new)
end
