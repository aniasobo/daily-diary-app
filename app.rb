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

  get '/entries/:id/entry' do
    @found_entry = Entry.find(params[:id])
    p @found_entry
    p "Am I executing? What the heck?"
    erb :entry
  # redirect "/entries/#{params[:id]}"
  end

  run! if app_file == $0
end
