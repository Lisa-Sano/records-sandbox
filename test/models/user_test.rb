require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user passwords must match" do 
    u = User.new(password: "dog", password_confirmation: "cat")
    assert_not u.valid?
    assert_includes u.errors.keys, :password_confirmation
  end

  # use fixtures for this test
  # good user, good password
  test "can authenticate known users" do
    # reach into users fixture (line 7 of users.yml)
    jeremy = users(:jeremy)

    # find user by email and authenticate using password, get back known user
    # wrap the find/authenticate in a convenience method called log_in in users.rb
    # assert_equal jeremy, User.find_by(email: jeremy[:email]).authenticate("password")
    assert_equal jeremy, User.log_in(jeremy[:email], "password")
  end

  # bad user, bad password
  test "won't authenticate mismatched data" do
    # must be false for assert_not to pass
    assert_not User.log_in("x", "y")
  end

  # good user, bad password
  test "won't authenticate a known user with a bad password" do
    jeremy = users(:jeremy)
    assert_not User.log_in(jeremy.email, "catdog")
  end
end
