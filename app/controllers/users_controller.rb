class UsersController < ApplicationController # => Gives class every method inside ApplicationController

    #renders login page
    get '/login' do
        if !logged_in?
            erb :login
        else
            redirect "/skis"
        end
    end

    post '/login' do
        #sets @user to current email address
        #if returns 'nil' then user needs to signup
        @user = User.find_by(email: params[:email])# email: is the key (find_by requires key/value pair)
        if @user && @user.authenticate(params[:password])
            #redirect
            session[:user_id] = @user.id #logs user in
            redirect "users/#{@user.id}"
        else
            flash[:message] = "Login was invalid. Please sign up or try again."
            #tell user info is invalid
            #redirect to login page
            redirect '/login'
        end
    end

    #renders signup page
    get '/signup' do
        if !logged_in?
            erb :'/users/signup'
        else
            redirect "/skis"
        end
    end

    post '/users' do
        #uses activerecord validations to make sure user entered in correct info
        @user_emails = User.all.collect{|user| user.email}
        if @user_emails.include?(params[:email])
            flash[:message] = "Signup was invalid. Email is already connected to another account. Please use a different email and try again."
            redirect '/signup'
        else
            @user = User.create(params)
        end
        if @user.save
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect '/signup'
        end
    end

    get '/users/:id' do
        if !logged_in?
            redirect '/login'
        else
            @user = User.find_by(id: params[:id])
            erb :'/users/show'
        end
    end

    get '/logout' do
        session.clear #logout user
        redirect '/'
    end

end