require 'pry'

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
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name) 
    @@all.find{ |song| name == song.name ? song : false }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    temp_array = @@all.collect {|song| song.name}.sort
    sorted_songs = temp_array.collect {|name| self.find_by_name(name)}
  end

  def self.new_from_filename(filename)
    array = filename.split(/[.-]/)
    artist = array[0].to_s.strip
    name = array[1].to_s.strip
    song = self.new
    song.name = name
    song.artist_name = artist
    @@all << song
    song
  end

  def self.create_from_filename(filename)
    array = filename.split(/[.-]/)
    artist = array[0].to_s.strip
    name = array[1].to_s.strip
    song = self.new
    song.name = name
    song.artist_name = artist
    @@all << song
    song
  end

  def self.destroy_all
    self.all.clear
  end
end
