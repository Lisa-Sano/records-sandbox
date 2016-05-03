class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  # returns either user instance or false
  def self.log_in(email, password)
    somebody = find_by(email: email)

    # split up find_by and authenticate in case there is no matching user with that email
    # (can't authenticate nil)
    somebody && somebody.authenticate(password)
  end
end
