require 'sinatra'
require 'json'
require './word_lists'

class BingoAPI < Sinatra::Base
  get '/api/v0.1/lists' do
    content_type :json
    WordLists.lists.keys.to_json
  end

  get '/api/v0.1/lists/:name' do
    lists = WordLists.lists

    halt 404 unless lists.has_key? params[:name]

    content_type :json
    WordLists.lists[params[:name]].to_json
  end

  run! if app_file == $0
end

