require 'sinatra'

set :port, 8080
set :static, true
set :public_folder, "static"
set :views, "views"

get '/post/' do 
  erb :greeting, :layout => :post
end

# redirect ohaiyo to hello
get '/ohaiyo/' do 
  redirect to ('/hello/')
end

# create an html page
get '/mypage/' do
  person = params['name'] || "Person"
  erb :mypage, :locals => {'user' => person}
end

get '/hello/' do
  greeting = params[:greeting] || "Hello there"
  erb :index, :locals => {'greeting' => greeting}
end

get '/greet/:name' do
  return "Say hello to #{params['name']}!"
end

get '/say/*/to/*' do
  return "So, you want to say #{params['splat'][0]} to #{params['splat'][1]}!"
end

get '/time/' do
  erb :mypage
end

# literal template
get '/literal/' do
  erb '%div.title This will be a string'
end
