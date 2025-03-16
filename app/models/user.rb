class User < ApplicationRecord
  has_secure_password
  has_many :entries, dependent: :destroy

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end
