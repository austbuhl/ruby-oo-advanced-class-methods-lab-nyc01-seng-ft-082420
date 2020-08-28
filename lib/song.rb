class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}.uniq
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    song = Song.new
    song.name = data[1].chomp(".mp3")
    song.artist_name = data[0]
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    song = Song.new
    song.name = data[1].chomp(".mp3")
    song.artist_name = data[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
