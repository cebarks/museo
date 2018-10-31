require './lib/artist'
require './lib/photograph'

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
end
