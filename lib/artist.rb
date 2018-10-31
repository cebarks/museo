class Artist
  attr_reader :id, :name, :born, :died, :country
  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @born = args[:born]
    @died = args[:died]
    @country = args[:country]
  end
end
