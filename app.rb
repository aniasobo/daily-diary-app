require 'sinatra/base'
require_relative './lib/entry.rb'
# require_relative './lib/db.rb'

class DailyDiary < Sinatra::Base
  enable :method_override
  enable :sessions

  get '/' do
    erb :index
  end

  get '/entries' do
    @entries = Entry.all
    erb :entries
  end

  get '/entries/:id' do
    @found_entry = Entry.find(:id)
    erb :entry
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
    erb :saved_entry
  end

  run! if app_file == $0
end
