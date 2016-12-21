class Artist < ActiveRecord::Base

  has_many :songs
  has_many :song_genres, through: :songs
  has_many :genres, through: :song_genres


  def slug
    result = self.name.downcase.gsub(" ", "-")
    result
  end

  def self.find_by_slug(slug)
    artist_name = slug.gsub("-", " ").downcase


    self.all.each do |artist|
      if artist.name.downcase == artist_name
        return artist
      end
    end
  end

end
