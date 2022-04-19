class KaraokeSinger < ActiveRecord::Base
  has_many :karaoke_singer_songs
  has_many :songs, through: :karaoke_singer_songs

  def sing(song)
    self.karaoke_singer_songs.create(song: song)
  end

  def buy_drink
    self.update(number_of_drinks: self.number_of_drinks + 1)
  end

  def songs_by_artist(artist_name)
    self.songs.map { |song| song.artist_name }.uniq
  end

  def drinks_tab(price_per_drink)
    self.number_of_drinks * price_per_drink
  end

  def self.total_tab(price_per_drink)
    self.all.sum { |singer| singer.drinks_tab(price_per_drink) }
  end

end
