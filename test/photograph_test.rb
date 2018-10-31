require 'minitest/autorun'
require 'minitest/pride'

require './lib/photograph'

class PhotographTest < Minitest::Test
  def setup
    attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"}
    @photo = Photograph.new(attributes)
  end

  def test_it_exists
    assert_instance_of Photograph, @photo
  end

  def test_it_has_an_id
    assert_equal "1", @photo.id
  end

  def test_it_has_a_name
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", @photo.name
  end

  def test_it_has_an_artist_id
    assert_equal "4", @photo.artist_id
  end

  def test_it_has_a_year
    assert_equal "1954", @photo.year
  end
end
