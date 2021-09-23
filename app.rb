require 'dotenv'
Dotenv.load
require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/hashtager.rb'

Hashtager.test

get "/" do
  "Hello World!"
end