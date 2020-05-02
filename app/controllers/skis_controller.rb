class SkisController < ApplicationController

    get '/skis' do
        @skis = Ski.all 
        binding.pry
    end

    get '/skis/new' do
        erb :'/skis/new'
    end

    post '/skis' do
        if !logged_in?
            redirect '/login'
        end
        if params[:name] || params[:brand] || params[:type] != ""
            raise params.inspect
            @ski = Ski.create(name: params[:name], brand: params[:brand], type: params[:type], user_id: current_user.id)
             redirect "/skis/#{ski.id}"
        else
            redirect '/skis/new'
        end#if create ski form doesn't have any blank spaces
    end


end