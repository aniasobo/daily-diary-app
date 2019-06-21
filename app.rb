require 'sinatra/base'
require_relative './lib/entry.rb'
require_relative './lib/db.rb'

class DailyDiary < Sinatra::Base
  enable :method_override

  get '/' do
    erb :index
  end

  post '/entry' do
    @title = params[:title]
    contents = params[:contents]
    @entry = Entry.create(@title, contents)
    redirect '/'
  end

  run! if app_file == $0
end
