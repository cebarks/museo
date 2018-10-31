require './lib/artist'
require './lib/photograph'
require './lib/file_io'

class Curator
  attr_reader :artists, :photographs

  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(photo_args)
    @photographs << Photograph.new(photo_args)
  end

  def add_artist(artist_args)
    @artists << Artist.new(artist_args)
  end

  def find_artist_by_id(id)
    @artists.find {|artist| artist.id == id}
  end

  def find_photograph_by_id(id)
    @photographs.find {|photo| photo.id == id}
  end

  def artists_with_multiple_photographs
    @artists.reject do |artist|
      find_photographs_by_artist(artist).length <= 1
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.select { |photo| photo.artist_id == artist.id}
  end

  def photographs_taken_by_artists_from(country)
    @photographs.select { |photo| find_artist_by_id(photo.artist_id).country == country}
  end

  def load_artists(file)
    FileIO.load_artists(file).each do |args|
      @artists << Artist.new(args)
    end
  end

  def load_photographs(file)
    FileIO.load_photographs(file).each do |args|
      @photographs << Photograph.new(args)
    end
  end

  def photographs_taken_between(range)
    @photographs.select { |photo| range.include?(photo.year.to_i)}
  end

  def artists_photographs_by_age(artist)
    photos = find_photographs_by_artist(artist)
    result = {}
    photos.each do |photo|
      result[photo.year.to_i - artist.born.to_i] = photo.name
    end
    result
  end
end
