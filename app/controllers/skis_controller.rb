class SkisController < ApplicationController

    get '/skis' do
        @skis = Ski.all 
        binding.pry
    end

    get '/skis/new' do
        erb :'/skis/new'
    end

    post '/skis' do

    end


end