class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres

    def artists
        Artist.all.select do |artist|
             self.songs.map {|song| song.artist_id}.include?(artist.id)
        end
    end

    def slug
        self.name.strip.downcase.gsub(/[^A-Za-z0-9]+/,"-")
    end

    def self.find_by_slug(slug)
        Genre.all.find {|genre| genre.slug == slug}
    end
end