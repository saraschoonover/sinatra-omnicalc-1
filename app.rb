require "sinatra"
require "sinatra/reloader"

get("/") do
 erb(:layout)
end

get("/square/new") do
  erb(:square_new)
end

get("/process_url") do
  @num = params.fetch("number").to_f
  @squared = @num * @num
  erb(:submitted_square)
end

get("/square_root/new") do
  erb(:square_root)
end

get("/process_url/squareroot") do 
  @num = params.fetch("number").to_f
  @sqrt = Math.sqrt(@num)
  erb(:submitted_sqrt)
end

get("/payment/new") do
  erb(:payment)
end

get("/random/new") do
  erb(:random)
end

get("/process_url/payment") do
  @apr = params.fetch("apr").to_f / 100
  @num_of_years = params.fetch("year").to_i
  @principal = params.fetch("principal").to_i
  @number_of_periods = @num_of_years * 12
  
  @payment = 
  erb(:submitted_payment)
end

get("/process_url/random") do
  @min = params.fetch("minimum").to_i
  @max = params.fetch("maximum").to_i
  @result = Random.new
  @newresult = @result.rand(@min..@max)
  erb(:submitted_random)
end
