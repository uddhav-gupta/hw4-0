class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_one_attached :image  # ActiveStorage file attachment

  validates :title, presence: true
  validates :occurred_on, presence: true
end
