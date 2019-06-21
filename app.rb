require 'sinatra/base'
require_relative './lib/entry.rb'
# require_relative './lib/db.rb'

class DailyDiary < Sinatra::Base
  enable :method_override

  get '/' do
    erb :index
  end

  get '/entries' do
    @entries = Entry.all
    p @entries
    p "THIS IS THE BUG PARAMS ARE EMPTY"
    p params
    erb :entries
  end

  get '/new' do
    erb :new
  end

  post '/new_entry' do
    @title = params[:title]
    @contents = params[:contents]
    Entry.create(@title, @contents)
    redirect '/saved'
  end

  get '/saved' do    
    # timestamp will be passed here
    erb :saved_entry
  end

  get '/entries/:id' do
    p "I PRINT YOUR PARAMS"
    p params
    @found_entry = Entry.find(params[:title])
    p @found_entry
    p "Am I executing? What the heck?"
    erb :entry
  # redirect "/entries/#{params[:id]}"
  end

  run! if app_file == $0
end
