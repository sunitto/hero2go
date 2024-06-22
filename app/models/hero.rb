class Hero < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :picture

  validates :name, presence: true
  validates :role, presence: true
  validates :job, presence: true
  validates :guild, presence: true
  validates :description, presence: true, length: { minimum: 6 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
