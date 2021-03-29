class Bookmark < ApplicationRecord
  # Asscoiations
  belongs_to :movie
  belongs_to :list
  # Validations
  validates_uniqueness_of :movie_id, scope: [:list_id]
  validates :comment, length: { minimum: 6 }
end
