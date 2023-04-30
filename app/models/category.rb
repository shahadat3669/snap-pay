class Category < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  has_and_belongs_to_many :payments

  validates :name, presence: true

  def value
    value = 0
    payments&.each do |payment|
      value += payment.amount
    end
    value
  end
end
