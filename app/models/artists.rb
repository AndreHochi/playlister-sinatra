class Artist < ActiveRecord::Base
    has_many :songs
    has_many :song_genres, through: :songs

    def genres
        Genre.all.select do |genre|
             self.song_genres.map {|song_genre| song_genre.genre_id}.include?(genre.id)
        end
    end

    def slug
        self.name.strip.downcase.gsub(/[^A-Za-z0-9]+/,"-")
    end

    def self.find_by_slug(slug)
        Artist.all.find {|artist| artist.slug == slug}
    end
end
