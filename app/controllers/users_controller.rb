class UsersController < ApplicationController # => Gives class every method inside ApplicationController

    #renders login page
    get '/login' do 
        erb :login
    end

    post '/login' do
        binding.pry
    end

    #renders signup page
    get '/signup' do

    end

end