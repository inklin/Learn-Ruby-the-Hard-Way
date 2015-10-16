require 'sinatra'
require './lib/gothonweb/map.rb'

set :port, 8080
set :static, true
set :public_folder, "public"
set :views, "views"
enable :sessions
set :session_secret, 'BADSECRET'

get '/' do
  session[:room] = 'START'
  redirect to('/game')
end

get '/game' do
  room = Map::load_room(session)

  if room
    erb :show_room, :locals => {:room => room}
  else
    erb :you_died
  end
end

post '/game' do
  room = Map::load_room(session)
  action = params[:action]

  if room
    next_room = room.go(action) || room.go("*")

    if next_room
      Map::save_room(session, next_room)
    end

    redirect to('/game')
  else
    erb :you_died
  end
end



## IMAGE UPLOAD PAGE ##
get '/upload/' do
  pictures = load_pictures
  erb :upload_form, :locals => {'pictures' => pictures}
end

## Get images and display
def load_pictures
  return Dir.glob("public/images/*.{jpg,jpeg}")
end

## post request to Upload page
post '/upload/' do
  # log what the file object looks like
  uploaded_file = params[:myfile]
  puts "The file object is #{uploaded_file}"
  # create a new file in public/images/filename 
  target = open('./public/images/' + uploaded_file[:filename], "w")
  # now we have to write the file to our empty file
  target.write(uploaded_file[:tempfile].read)
  target.close()
  
  pictures = load_pictures
  erb :upload_form, :locals => {'pictures' => pictures}
end
