require 'sinatra/base'
require './lib/link'
require './spec/database_connection_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb(:index)
  end

  get '/links' do
    @links = Link.all
    erb(:links)
  end

  post '/add_link' do
    flash[:notice] = "Please enter correct url" unless Link.add(url: params['url'])
    redirect '/links'
  end

  run! if app_file == $0
end
