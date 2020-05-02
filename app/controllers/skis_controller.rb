class SkisController < ApplicationController

    get '/ski_collection/new' do
        erb :'/skis/new'
    end

    get '/ski_collection' do
        @ski_collection = Ski.all 
        binding.pry
    end

end