class SongGenresController < ApplicationController

    set :views, "app/views/song_genres"
    get '/song_genres' do
        @song_genres = SongGenres.all
        erb :index
    end
end