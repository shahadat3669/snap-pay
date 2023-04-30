class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :amount, presence: true

  validate :validate_category_presence

  private

  def validate_category_presence
    return unless categories.empty?

    errors.add(:categories, 'must be present')
  end
end
