require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "validations: album title can't be blank" do
    album = Album.new

    assert_not album.valid?
    assert album.errors.keys.include?(:title), "title is not in the errors hash"
  end
end
