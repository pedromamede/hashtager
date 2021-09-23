require 'dotenv'
Dotenv.load
require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/hashtager.rb'

get "/" do
  erb :form
end

post '/save_image' do
  @filename = params[:file][:filename]
  file = params[:file][:tempfile]

  File.open("./public/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end

  @labels = Hashtager.get_labels @filename
  
  erb :show
end