require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Bookmark Manager'
  end
  
  get '/bookmarks/new' do
    erb :bookmarks_new
  end
  
  post '/bookmarks' do
   temp = Bookmark.new
   @bookmarks = temp.all
   Bookmark.create(url: params[:url])
    # erb :bookmarks
  end
  
  run! if app_file == $0
end