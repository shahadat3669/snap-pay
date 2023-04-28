require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'Shahadat Hossain', email: 'shahadat@example.com', password: '12345678') }

  describe 'validations' do
    it 'requires a category name' do
      category = Category.create(name: '', user:)

      expect(category).to_not be_valid
    end

    it 'requires a user' do
      category = Category.create(name: 'Category 1')

      expect(category).to_not be_valid
    end

    it 'is valid with all required attributes' do
      category = Category.create(name: 'Category 1', user:)

      expect(category).to be_valid
    end
  end
end
