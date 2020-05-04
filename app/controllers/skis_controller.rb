class SkisController < ApplicationController

    get '/skis' do
        if logged_in? # Can only access skis page if logged in
            @user = current_user
            @skis = current_user.skis
            #binding.pry
            erb :'skis/index'
        else
            redirect '/login'
        end
    end

    get '/skis/new' do
        erb :'/skis/new'
    end

    post '/skis' do
        if !logged_in?
            redirect '/login'
        end
        if complete_form? #checks if all text fields contain text
            @ski = Ski.create(name: params[:name], brand: params[:brand], width: params[:width], category: params[:category], user_id: @current_user.id)
            binding.pry
             redirect "/skis/#{@ski.id}"
        else
            redirect '/skis/new'
        end#
    end

    get "/skis/:id" do
        if !logged_in? #user can only view skis if they are logged in
            redirect '/login'
        else 
            @ski = Ski.find(params[:id])
            erb :'/skis/show'
        end
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
        if !logged_in?
            if @ski.user == current_user && complete_form?
                @ski.update(name: params[:name], brand: params[:brand], width: params[:width], category: params[:category])
                redirect "/skis/#{@ski.id}" #shows the ski
            else
                redirect "/skis/#{@ski.id}/edit"
            end
        else
            redirect '/'
        end
    end

    # def get_ski
    #     @ski = Ski.find(params[:id]) 
    # end

    def complete_form?
        flag = nil
        if params[:name] != "" && params[:brand] != "" && params[:category] != "" && params[:width] != ""
            flag = true
        else
            flag = false
        end
        flag
    end

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