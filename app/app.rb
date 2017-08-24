ENV['RACK_ENV'] ||= 'development'
require 'sinatra'
require_relative './models/link'
require_relative './models/tag'
require 'sinatra/base'





class BookmarkManager < Sinatra::Base
  get'/links' do
    @links = Link.all
    @tags = Tag.all
    erb :'links/index'
  end

  get'/links/new' do
    erb :'links/new'
  end

  post'/links' do
    link = Link.create(
      :title => params[:title],
      :url => params[:url]
    )
    tag = Tag.create(
      :tagname => params[:tagname]
    )
    link.tags << tag
    link.save
    redirect '/links'
  end
end
