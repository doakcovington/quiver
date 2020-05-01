#NCWH
#WDGTR
require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #allows for a cookie to presist across multiple HTTP requests 
    set :session_secret, "prayforsnow" #allows for session id 
  end

  get "/" do
    erb :welcome
  end

end
