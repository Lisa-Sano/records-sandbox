class Album < ActiveRecord::Base
  validates :title, presence: true
  validates :label_code, presence: true
  belongs_to :artist
end
