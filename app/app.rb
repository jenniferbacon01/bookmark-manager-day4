ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

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

  get '/tags/bubbles' do
    @links = Link.all
    @tags = Tag.all
    erb :'tags/bubbles'
  end
end
