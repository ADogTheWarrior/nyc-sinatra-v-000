class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get "/figures/new" do
    erb :'/figures/new'
  end

  post '/figures' do
    figure = Figure.create(name: params[:figure_name])

    if params.key?("figure")
      if params[:figure].key?("title_ids")
        params[:figure][:title_ids].each do |id|
          title = Title.find(id)
          figure.titles << title
          figure.save
          title.save
        end
      end

      if params[:figure].key?("landmark_ids")
        params[:figure][:landmark_ids].each do |id|
          landmark = Landmark.find(id)
          figure.landmarks << landmark
          figure.save
          landmark.save
        end
      end
    end

    if !params[:new_title].empty?
      title = Title.create(name: params[:new_title])
      figure.titles << title
      figure.save
      title.save
    end

    if !params[:new_landmark].empty?
      landmark = Landmark.create(name: params[:new_landmark])
      figure.landmarks << landmark
      figure.save
      landmark.save
    end

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

  post '/figures/:id' do
    figure = Figure.find(params[:id])

    if params[:figure_name] != ""
      figure.update(name: params[:figure_name])
    end

    if params.key?("figure")
      if params[:figure].key?("title_ids")
        params[:figure][:title_ids].each do |id|
          title = Title.find(id)
          figure.titles << title
          figure.save
          title.save
        end
      end

      if params[:figure].key?("landmark_ids")
        params[:figure][:landmark_ids].each do |id|
          landmark = Landmark.find(id)
          figure.landmarks << landmark
          figure.save
          landmark.save
        end
      end
    end

    if !params[:new_title].empty?
      title = Title.create(name: params[:new_title])
      figure.titles << title
      figure.save
      title.save
    end

    if !params[:new_landmark].empty?
      landmark = Landmark.create(name: params[:new_landmark])
      figure.landmarks << landmark
      figure.save
      landmark.save
    end

    redirct_string = '/figures/' + @figure.id.to_s
    redirect to redirct_string
  end
end
