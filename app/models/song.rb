class Song < ActiveRecord::Base
  has_many :karaoke_singer_songs
  has_many :karaoke_singers, through: :karaoke_singer_songs

  def self.find_by_artist(artist_name)
    self.all.find_by(artist_name: artist_name)
  end

  def number_of_times_sung
    self.karaoke_singer_songs.count
  end

end
