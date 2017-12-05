class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    Landmark.create(params)
    puts "params= #{params}"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/new'
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end
end
