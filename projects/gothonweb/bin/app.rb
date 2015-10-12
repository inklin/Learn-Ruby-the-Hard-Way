require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/' do
  return "Hello World"
end

get '/hello/' do
  erb :hello_form
end

post '/hello/' do
  greeting = params[:greeting] || "Hello There"
  sender = params[:sender] || "Nobody"
  recipient = params[:recipient] || "You"

  erb :index, :locals => {'greeting' => greeting, 'sender' => sender, 'recipient' => recipient}
end
