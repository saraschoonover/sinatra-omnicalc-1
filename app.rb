require "sinatra"
require "sinatra/reloader"
#require "./config/environment"

get("/") do
 erb(:random)
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
  @apr = params.fetch("apr").to_f
  @num_of_years = params.fetch("year").to_i

  @principal = params.fetch("principal").to_i

  periods_remaining = @num_of_years * 12
  monthly_interest_rate = @apr.round(4) / 100 / 12
  numerator = @principal * monthly_interest_rate * (1 + monthly_interest_rate)** periods_remaining
  denominator = (1 + monthly_interest_rate)** periods_remaining - 1

  @monthly_payment = numerator / denominator

  @formatted_apr = sprintf("%.4f", @apr)
  # @formatted_principal = sprintf("$%.2f", @principal)
  #@formatted_principalll = number_to_currency(@principal, precision: 2)
 
  erb(:submitted_payment)
end

get("/process_url/random") do
  @min = params.fetch("minimum").to_i
  @max = params.fetch("maximum").to_i
  @result = Random.new
  @newresult = @result.rand(@min..@max)
  erb(:submitted_random)
end
