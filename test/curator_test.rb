require 'minitest/autorun'
require 'minitest/pride'

require './lib/curator'

class CuratorTest < Minitest::Test
  def setup
    @curator = Curator.new
  end

  def setup_photos
    photo_1 = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"}
    photo_2 = {
      id: "2",
      name: "Moonrise, Hernandez",
      artist_id: "2",
      year: "1941"  }
      @curator.add_photograph(photo_1)
      @curator.add_photograph(photo_2)
  end

  def setup_artists
    artist_1 = {
      id: "1",
      name: "Henri Cartier-Bresson",
      born: "1908",
      died: "2004",
      country: "France" }
    artist_2 = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States" }
    @curator.add_artist(artist_1)
    @curator.add_artist(artist_2)
  end

  def test_it_exists
    assert_instance_of Curator, @curator
  end

  def test_it_starts_with_no_artists
    assert_equal [], @curator.artists
  end

  def test_it_starts_with_no_photographs
    assert_equal [], @curator.photographs
  end

  def test_it_can_add_photographs
    setup_photos
    assert_equal 2, @curator.photographs.length
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", @curator.photographs.first.name
  end

  def test_it_can_add_artists
    setup_artists
    assert_equal 2, @curator.artists.length
    assert_equal "Henri Cartier-Bresson", @curator.artists.first.name
  end

  def test_it_can_find_artists_by_id
    setup_artists
    assert_equal "Henri Cartier-Bresson", @curator.find_artist_by_id("1").name
  end

  def test_it_can_find_photograph_by_id
    setup_photos
    assert_equal "Moonrise, Hernandez", @curator.find_photograph_by_id("2").name
  end
end
