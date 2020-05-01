class UsersController < ApplicationController # => Gives class every method inside ApplicationController

    #renders login page
    get '/login' do 
        erb :login
    end

    post '/login' do
        #sets @user equal to current email address
        #if returns 'nil' then user needs to signup
        @user = User.find_by(email: params[:email]) # email: is the key (find_by requires key/value pair)
        if @user.authenticate(params[:params])
            #redirect
            session[:user_id] = @user.id #logs user in
            redirect "users/#{@user.id}"
        else
            #tell user info is invalid
            #redirect to login page
        end
    end

    #renders signup page
    get '/signup' do

    end

    get '/users/:id/' do
        "Hello"
    end

end