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
      year: "1941"}

    photo_3 = {
      id: "3",
      name: "Identical Twins, Roselle, New Jersey",
      artist_id: "3",
      year: "1967"}

    photo_4 = {
      id: "4",
      name: "Child with Toy Hand Grenade in Central Park",
      artist_id: "3",
      year: "1962"}

    @curator.add_photograph(photo_1)
    @curator.add_photograph(photo_2)
    @curator.add_photograph(photo_3)
    @curator.add_photograph(photo_4)
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

    artist_3 = {
    id: "3",
      name: "Diane Arbus",
      born: "1923",
      died: "1971",
      country: "United States"}

    @curator.add_artist(artist_1)
    @curator.add_artist(artist_2)
    @curator.add_artist(artist_3)
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
    assert_equal 4, @curator.photographs.length
    assert_equal "Rue Mouffetard, Paris (Boy with Bottles)", @curator.photographs.first.name
  end

  def test_it_can_add_artists
    setup_artists
    assert_equal 3, @curator.artists.length
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

  def test_it_can_find_photographs_by_artist
    setup_artists
    setup_photos

    diane_arbus = @curator.find_artist_by_id("3")
    actual = @curator.find_photographs_by_artist(diane_arbus)

    assert_equal 2, actual.length
    assert_equal "3", actual.first.id
    assert_equal "4", actual.last.id
  end

  def test_it_can_find_artists_with_multiple_photographs
    setup_artists
    setup_photos

    diane_arbus = @curator.find_artist_by_id("3")
    actual = @curator.artists_with_multiple_photographs

    assert_equal 1, actual.length
    assert_equal diane_arbus, actual.first
  end

  def test_photographs_taken_by_artists_from
    setup_artists
    setup_photos

    actual = @curator.photographs_taken_by_artists_from("United States")
    actual.each { |photo| assert_equal "United States", photo.country }

    actual = @curator.photographs_taken_by_artists_from("Argentina")
    assert_equal [], actual
  end
end
