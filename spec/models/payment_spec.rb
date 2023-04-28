require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:author) { User.create(name: 'Shahadat Hossain', email: 'shahadat@example.com', password: '12345678') }
  let(:category) { Category.create(name: 'Category 1', user: author) }

  describe 'validations' do
    it 'requires a payment name' do
      payment = Payment.new(amount: 10.0, author:, categories: [category])

      expect(payment).to_not be_valid
    end

    it 'requires a payment amount' do
      payment = Payment.new(name: 'Test Payment', author:, categories: [category])

      expect(payment).to_not be_valid
    end

    it 'requires a author' do
      payment = Payment.new(name: 'Test Payment', amount: 10.0, categories: [category])

      expect(payment).to_not be_valid
    end

    it 'is invalid without any categories' do
      payment = Payment.new(name: 'Test Payment', amount: 10.0, author:)

      expect(payment).to_not be_valid
    end

    it 'is valid with all required attributes' do
      payment = Payment.new(name: 'Test Payment', amount: 10.0, author:, categories: [category])

      expect(payment).to be_valid
    end
  end

  describe 'associations' do
    it 'belongs to an author' do
      payment = Payment.new(name: 'Test Payment', amount: 10.0, author:)

      expect(payment.author).to eql(author)
    end

    it 'has and belongs to many categories' do
      payment = Payment.new(name: 'Test Payment', amount: 10.0, author:, categories: [category])

      expect(payment.categories).to include(category)
    end
  end
end
