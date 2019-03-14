class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get 'artists/new' do
    @artists = Artist.all
    erb :'artists/new'
  end

  post '/artists' do
    @artist = Artist.create(params[:artist])
    redirect to "/artists"
  end

  get '/artists/:id' do
    @artist = Artist.find(params[:id])
    erb :"/artists/show"
  end

  get '/artists/:id/edit' do
    @artist = Artist.find(params[:id])
    erb :"/artists/#{@artist.id}/edit"
  end

  patch '/artists/:id' do
    @artist = Artist.find(params[:id])
    @artist.name = params[:artist][:name]
    @artist.save
    redirect to "/artists/#{@artist.id}"
  end

  delete '/artists/:id' do
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect to "/artists"
  end


end
