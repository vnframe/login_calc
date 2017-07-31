require "sinatra"
require_relative "calculator.rb"

get "/" do
erb :home
end

post '/home' do
  pass = params[:password]

  ary = ["1234", "5678", "3221"]
  case pass.include?(ary[0]) || pass.include?(ary[1]) || pass.include?(ary[2])
  when true
  redirect '/name?password=' + pass
  when false
  redirect '/wrong_pass?password=' + pass
  end
end

get "/wrong_pass" do
  pass = params[:password]
  erb :wrong_pass, :local => {:pass => pass}
end

get '/name' do
  pass = params[:password]
  # lname = params[:last_name]
  # fname = params[:first_name]
  puts "MADE IT TO NAME GET"
  puts "pass is #{pass}" #working here
  erb :name, :locals => {:pass => pass}
end

post '/name' do
  pass = params[:password]
  lname = params[:last_name]
  fname = params[:first_name]
  puts "MADE IT TO NAME POST"
  puts "lname is #{lname}"
  puts "fname is #{fname}"
  puts "pass is #{pass}" #working here
  redirect '/calc?password=' + pass + '&first_name=' + fname + '&last_name=' + lname
end

get '/calc' do
  pass = params[:password]
  fname = params[:first_name]
  lname = params[:last_name]
  puts "MADE IT TO GET CALC"
  puts "lname is #{lname}"
  puts "fname is #{fname}"
  puts "pass is #{pass}"
  erb :calc, :locals => {:pass => pass, :fname => fname, :lname => lname}
end
post "/calc" do
pass = params[:password]
fname = params[:first_name]
lname = params[:last_name]
num1 = params[:num1]
num2 = params[:num2]
cal = params[:cal]
total = calculate(cal, num1, num2)
redirect '/results?password=' + pass + '&first_name=' + fname + '&last_name=' + lname + '&num1=' + num1 + '&num2=' + num2 + '&cal=' + cal + '&total=' + total
end

get "/results" do
  pass = params[:password]
  fname = params[:first_name]
  lname = params[:last_name]
  num1 = params[:num1]
  num2 = params[:num2]
  cal = params[:cal]
  total = params[:total]

  erb :results, :locals => {:pass => pass, :fname => fname, :lname => lname, :num1 => num1, :num2 => num2, :cal => cal, :total => total}
end

post "/results" do
  pass = params[:password]
  fname = params[:first_name]
  lname = params[:last_name]
  # num1 = params[:num1]
  # num2 = params[:num2]
  # cal = params[:cal]
  # total = params[:total]
  puts "MADE IT TO POST RESULT"
  puts "lname is #{lname}"
  puts "fname is #{fname}"
  puts "pass is #{pass}"
  redirect '/calc?password=' + pass + '&first_name=' + fname + '&last_name=' + lname
end
