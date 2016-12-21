class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end


  post '/songs' do
    @song = Song.create(name: params[:song][:name], artist: params[:artist][])

    if !params[:artist][:name].empty?
      @artist = Artist.create(name: params[:artist][:name])
      @song.artist = @artist
      @song.save
    end
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
  end

  patch '/songs/:slug' do
  end

end
