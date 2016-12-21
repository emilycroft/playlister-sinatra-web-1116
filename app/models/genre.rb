class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  def slug
    result = self.name.downcase.gsub(" ", "-")
    result
  end

  def self.find_by_slug(slug)
    genre_name = slug.gsub("-", " ").downcase


    self.all.each do |genre|
      if genre.name.downcase == genre_name
        return genre
      end
    end
  end


end
