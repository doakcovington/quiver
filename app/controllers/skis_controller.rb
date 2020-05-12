class SkisController < ApplicationController

    get '/skis' do #lists all skis in a users collection
        if logged_in? # Can only access skis page if logged in
            @user = current_user
            @skis = current_user.skis
            #binding.pry
            erb :'skis/index'
        else
            redirect '/login'
        end
    end

    #Presents form for user to input new ski information
    get '/skis/new' do
        erb :'/skis/new'
    end

    #Adds a new ski to a users collection
    post '/skis' do
        if !logged_in?
            redirect '/login'
        end
        if complete_form? #checks if all text fields contain text
            @ski = Ski.create(name: params[:name], brand: params[:brand], width: params[:width], length: params[:length], category: params[:category], user_id: @current_user.id)
             redirect "/skis/#{@ski.id}"
        else
            redirect '/skis/new'
        end
    end

    #shows specific ski in a users collection
    # get "/skis/:id" do
    #     if !logged_in? #user can only view skis if they are logged in
    #         redirect '/login'
    #     else #elsif @ski = Ski.find(params[:id]) is true
    #         @ski = Ski.find(params[:id])
    #         erb :'/skis/show'
    #         binding.pry
    #     end #else ski doesnt exist and redirect to index page
    # end

    get "/skis/:id" do
        if !logged_in?
            redirect '/login'
        elsif @ski = Ski.find(params[:id]).user_id != current_user.id 
            redirect "users/#{current_user.id}"
        else
            @ski = Ski.find(params[:id])
            erb :'skis/show'
        end

    end

    #Present a user with a form to edit an existing ski 
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
        if logged_in?
            if @ski.user == current_user && complete_form?
                @ski.update(name: params[:name], brand: params[:brand], width: params[:width], length: params[:length], category: params[:category])
                redirect "/skis/#{@ski.id}" #shows the ski
            else
                redirect "/skis/#{@ski.id}/edit"
            end
        else
            redirect '/'
        end
    end

    def get_ski
        @ski = Ski.find(params[:id]) 
    end

    def complete_form?
        flag = nil
        if params[:name] != "" && params[:brand] != "" && params[:category] != "" && params[:width] != "" && params[:length] != ""
            flag = true
        else
            flag = false
        end
        flag
    end

    #destorys ski from users collection
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