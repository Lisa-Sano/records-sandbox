class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :label_code, presence: true

  validate :released_cant_be_in_the_future

  belongs_to :artist

  private

  def released_cant_be_in_the_future
    if released.present? && released > Date.today.year
      errors.add(:released, "can't be in the future")
    end
  end
end
