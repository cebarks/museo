class Photograph
  attr_reader :id, :name, :year, :artist_id
  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @year = args[:year]
    @artist_id = args[:artist_id]
  end
end
