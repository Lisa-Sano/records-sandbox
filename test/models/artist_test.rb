require 'test_helper'
require 'pry'

class ArtistTest < ActiveSupport::TestCase
  test "artist can have albums" do
    # binding.pry # interrupts code and gives a console so i can see scope
    assert_includes artists(:the_clash).albums, albums(:combat_rock)
  end

  # positive test case
  test "display name for The Clash should be Clash, The" do
    # assert_equal expected, actual
    assert_equal "Clash, The", artists(:the_clash).display_name
  end

  # negative test case
  test "display name for Thelonious Monk should not be lonious Monk, The" do
    # do this instead of using a magic value "Thelonious Monk"
    assert_equal artists(:tmonk).name, artists(:tmonk).display_name
  end

  test "display name for an artist with no name should be an empty string" do
    assert_equal "", Artist.new.display_name
  end

  test "display name for YY should be YY" do
    assert_equal artists(:yy).name, artists(:yy).display_name
  end
end
