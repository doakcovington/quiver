class UsersController < ApplicationController # => Gives class every method inside ApplicationController

    #renders login page
    get '/login' do 
        erb :login
    end

    post '/login' do
        #sets @user equal to current email address
        #if returns 'nil' then user needs to signup
        @user = User.find_by(email: params[:email])# email: is the key (find_by requires key/value pair)
        if @user && @user.authenticate(params[:password])
            #redirect
            session[:user_id] = @user.id #logs user in
            redirect "users/#{@user.id}"
        else
            #tell user info is invalid
            #redirect to login page
            redirect '/login'
        end
    end

    #renders signup page
    get '/signup' do
        erb :'/users/signup'
    end

    post '/users' do
        #uses activerecord validations to make sure user entered in correct info
        @user = User.create(params)
        if @user.save
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect '/signup'
        end
    end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    get '/logout' do
        session.clear #logout user
        redirect '/'
    end

end