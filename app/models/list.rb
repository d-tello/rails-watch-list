class List < ApplicationRecord
  # Associations
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true
end
