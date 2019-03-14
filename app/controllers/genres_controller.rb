class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get 'genres/new' do
    @genres = Genre.all
    erb :'/genres/new'
  end

  post '/genres' do
    @genre = Genre.create(params[:artist])
    redirect to "/genres"
  end

  get '/genres/:id' do
    @genre = Genre.find(params[:id])
    erb :"/genres/show"
  end

  get '/genres/:id/edit' do
    @genre = Genre.find(params[:id])
    erb :"/genres/#{@artist.id}/edit"
  end

  patch '/genres/:id' do
    @genre = Genre.find(params[:id])
    @genre.name = params[:artist][:name]
    @genre.save
    redirect to "/genres/#{@genre.id}"
  end

  delete '/genres/:id' do
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect to "/genres"
  end


end
