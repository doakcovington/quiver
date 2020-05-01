class UsersController < ApplicationController # => Gives class every method inside ApplicationController

    #renders login page
    get '/login' do 
        erb :login
    end

    post '/login' do
        #sets @user equal to current email address
        #if returns 'nil' then user needs to signup
        @user = User.find_by(email: params[:email])

        if @user.authenticate(params[:email])
            #redirect
        else
            #tell user info is invalid
            #redirect to login page
        end
        binding.pry
    end

    #renders signup page
    get '/signup' do

    end

end