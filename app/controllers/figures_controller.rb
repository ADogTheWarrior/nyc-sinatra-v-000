class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get "/figures/new" do
    erb :'/figures/new'
  end

  post '/figures' do
puts "params= #{params}"
#ex: params= {"figure_name"=>"Doctor Who", "figure"=>{"landmark_ids"=>["489"]}, "new_landmark"=>"", "new_title"=>""}
    redirect to 'figures/index'
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end
end
