require 'sinatra/base'
require_relative './lib/entry.rb'
# require_relative './lib/db.rb'

class DailyDiary < Sinatra::Base
  enable :method_override

  get '/' do
    erb :index
  end

  post '/entry' do
    @title = params[:title]
    @contents = params[:contents]
    Entry.create(@title, @contents)
    redirect '/saved'
  end

  get '/saved' do    
    # timestamp will be passed here
    erb :saved_entry
  end

  run! if app_file == $0
end
