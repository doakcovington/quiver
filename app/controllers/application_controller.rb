#NCWH
#WDGTR
require './config/environment' #requires all gems in stack


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions #allows for a cookie to presist across multiple HTTP requests 
    set :session_secret, "prayforsnow" #allows for session id 
    register Sinatra::Flash
  end

  get "/" do
    if !logged_in?
      erb :welcome
    else
      redirect "/skis"
    end
  end

  helpers do
    
    def logged_in?
      !!current_user
    end

    # Finds current user using the session hash
    #Returns nil if there is no match 
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    # def if_logged_in
    #   if logged_in?
    #     redirect "/users/#{current_user.id}"
    #   end
    # end

  end

end
