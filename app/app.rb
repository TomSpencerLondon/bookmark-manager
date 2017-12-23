require 'sinatra/base'
require_relative 'bookmark_helper'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Bookmark < Sinatra::Base
  include BookmarkHelper
  register Sinatra::Flash
  # Default env should be development unless explicitly changed
  ENV["RACK_ENV"] ||="development"
  enable :sessions
  set :session_secret, 'probably not really that secret'

  get '/links' do
    @user_name = get_current_user.email if get_current_user
    @links = Link.all
    erb(:links)
  end

  delete '/links/:id' do
    link = Link.get(id)
    link.destroy 
  end

  run! if app_file == $0
end
