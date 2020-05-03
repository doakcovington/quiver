class SkisController < ApplicationController

    get '/skis' do
        @skis = Ski.all
        erb :'skis/show'
    end

    get '/skis/new' do
        erb :'/skis/new'
    end

    post '/skis' do
        if !logged_in?
            redirect '/login'
        end
        if params[:name] || params[:brand] || params[:category] != ""
            @ski = Ski.create(name: params[:name], brand: params[:brand], category: params[:category], user_id: @current_user.id)
             redirect "/skis/#{@ski.id}"
        else
            redirect '/skis/new'
        end#if create ski form doesn't have any blank spaces
    end

    get "/skis/:id" do
        @ski = Ski.find(params[:id])
         erb :'/skis/show'
    end

    get "/skis/:id/edit" do
        @ski = Ski.find(params[:id])
        erb :'/skis/edit'
    end

    #Changes the attributes for the ski
    patch '/skis/:id' do
        @ski = Ski.find(params[:id]) #finds the ski
        @ski.update(name: params[:name], brand: params[:brand], category: params[:category])
        binding.pry
        redirect "/skis/#{@ski.id}" #shows the ski
    end

    # def find_ski_with_params_id
    #     @ski = Ski.find(params[:id]) 
    # end

end