class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :hero
  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  before_validation :total_price, :total_days

  def total_days
    return unless hero && start_date && end_date
    (end_date - start_date).to_i + 1
  end

  def total_price
    return unless hero && start_date && end_date
    self.total_price = hero.price.to_f * total_days
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "ending date must be after starting date")
    end
  end
end
