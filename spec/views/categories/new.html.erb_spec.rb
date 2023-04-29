# spec/features/categories_spec.rb

require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  let(:user) { User.create(name: 'Shahadat Hossain', email: 'shahadat3669@gmail.com', password: '12345678') }

  describe 'create new category' do
    before(:each) do
      sign_in user
      visit new_category_path
    end

    it 'displays the correct page title' do
      expect(page).to have_content('New Category')
    end

    it 'displays the form Name field' do
      expect(page).to have_field(placeholder: 'Name')
    end

    it 'displays the Create category button' do
      expect(page).to have_button('Create Category')
    end

    it 'should redirect to categories index page when clicked' do
      find("form[action='/categories'] button").click

      expect(current_path).to eq(categories_path)
    end
  end
end
