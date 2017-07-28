require "sinatra"
get "/" do
erb :home
end
post '/home' do
  password = params[:password]

  ary = ["1234", "7654", "1324"]
  case password.include?(ary[0])
  when true
  redirect '/calc?password=' + password
  when false
  redirect '/wrong_pass?password=' + password
  end
end

get '/calc' do
  password = params[:word]
  erb :calc, :locals => {:password => password}
end

get "/wrong_pass" do
  password = params[:word]
  erb :wrong_pass, :local => {:password => password}
end
