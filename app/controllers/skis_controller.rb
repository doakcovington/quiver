class SkisController < ApplicationController

    get '/skis' do
        @user = current_user
        @skis = current_user.skis
        #binding.pry
        erb :'skis/index'
    end

    get '/skis/new' do
        erb :'/skis/new'
    end

    post '/skis' do
        if !logged_in?
            redirect '/login'
        end
        if params[:name] != "" && params[:brand] != "" && params[:category] != "" #checks if all text fields contain text
            @ski = Ski.create(name: params[:name], brand: params[:brand], category: params[:category], user_id: @current_user.id)
            binding.pry
             redirect "/skis/#{@ski.id}"
        else
            redirect '/skis/new'
        end#
    end

    get "/skis/:id" do
        @ski = Ski.find(params[:id])
         erb :'/skis/show'
    end

    get "/skis/:id/edit" do
        @ski = Ski.find(params[:id])
        if @ski.user == current_user #only the current user can edit their ski
            erb :'/skis/edit'
        else
            redirect "users/#{current_user.id}"
        end
    end

    #Changes the attributes for the ski
    patch '/skis/:id' do
        @ski = Ski.find(params[:id]) #finds the ski
        @ski.update(name: params[:name], brand: params[:brand], category: params[:category])
        binding.pry
        redirect "/skis/#{@ski.id}" #shows the ski
    end

    # def get_ski
    #     @ski = Ski.find(params[:id]) 
    # end

    delete '/skis/:id' do
        @ski = Ski.find(params[:id])
        if @ski.user == current_user && logged_in? #only the current user can edit their ski
            @ski.destroy
            redirect "/skis"
        else
            redirect "users/#{current_user.id}"
        end
    end

end