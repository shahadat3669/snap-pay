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

  describe 'associations' do
    it 'belongs to an user' do
      category = Category.create(name: 'Category 1', user:)

      expect(category.user).to eql(user)
    end
  end

  describe 'Active Storage attachments' do
    it 'allows attachment of an icon' do
      category = Category.create(name: 'Category 1', user:)
      file = fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'placeholder.png'), 'image/png')
      category.icon.attach(file)

      expect(category.icon).to be_attached
    end
  end
end
