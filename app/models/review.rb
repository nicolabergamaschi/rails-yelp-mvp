class Review < ApplicationRecord
  belongs_to :restaurant
  validates :content, :rating, presence: true
  validates :rating, comparison: { less_than_or_equal_to: 5}
  validates :rating, numericality: { only_integer: true}
end
