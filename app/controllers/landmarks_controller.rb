class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    landmark = Landmark.create(name: params[:name], year_completed: params[:year_completed])
    redirect to 'landmark/index'
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    landmark = Landmark.find(params[:id])

    if params[:name] != ""
      landmark.update(name: params[:name])
    end

    if params[:year_completed] != ""
      landmark.update(year_completed: params[:year_completed])
    end

    redirct_string = '/landmarks/' + @landmark.id.to_s
    redirect to redirct_string
  end
end
