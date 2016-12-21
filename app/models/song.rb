class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres


  def slug
    result = self.name.downcase.gsub(" ", "-")
    result
  end

  def self.find_by_slug(slug)
    song_name = slug.gsub("-", " ").downcase


    self.all.each do |song|
      if song.name.downcase == song_name
        return song
      end
    end
  end

end
