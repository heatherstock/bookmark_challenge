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
    flash[:notice] = "Please enter correct url" unless Link.add(url: params['url'], title: params['title'])
    redirect '/links'
  end

  post '/delete_link' do
    Link.delete(params['id'])
    redirect '/links'
  end

  get '/edit_link/:id' do
    @link = Link.find(params['id'])
    erb(:edit_link)
  end

  # WHY PUTS NOT WORKING??? check .erb
  post '/update_link/:id' do
    # Link.update(params['id'], params['title'], params['url'])
    Link.update(params)
    redirect '/links'
  end

  run! if app_file == $0
end
