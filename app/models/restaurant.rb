class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: ['french', 'italian', 'chinese', 'japanese', 'belgian'] }
end
