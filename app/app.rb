require 'sinatra'
require_relative './models/link'
require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  get'/links' do
    @links = Link.all
    erb :'links/index'
  end
end