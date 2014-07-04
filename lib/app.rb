require 'sinatra/base'
require "sinatra/activerecord"

class Link < ActiveRecord::Base
  validates_presence_of :url
end

class App < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :database, adapter: "sqlite3", database: "db-#{ENV['RACK_ENV']}.sqlite3"

  BASE_URL = {
      'test' => 'example.com',
      'development' => 'localhost:9292',
      'production' => 'laier-url-shortener.herokuapp.com'
    }[ENV['RACK_ENV']]

  get '/' do
    erb :index
  end

  post '/shorten' do
    link = Link.new(url: params[:url])
    link.save
    
    new_link = "http://#{BASE_URL}/r/#{link.id}"

    erb :new_link, locals: {new_link: new_link}
  end

  get "/r/:link_id" do    
    link = Link.find(params[:link_id])
    redirect link.url
  end

end
