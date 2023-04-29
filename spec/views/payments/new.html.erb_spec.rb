require 'rails_helper'

RSpec.describe 'payments/new.html.erb', type: :feature do
  let(:author) { User.create(name: 'Shahadat Hossain', email: 'shahadat@example.com', password: '12345678') }
  let(:icon) { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'placeholder.png'), 'image/png') }

  let(:category) { Category.create(name: 'Category 1', icon:, user: author) }

  context 'when logged in' do
    before(:each) do
      sign_in author
      @payment = Payment.create(name: 'Test Payment', amount: 10.00, category_ids: [category.id])
      visit new_category_payment_path(category)
    end

    it 'displays the correct page title' do
      expect(page).to have_content('New Payment')
    end

    it 'displays the form Name field' do
      expect(page).to have_field(placeholder: 'Name')
    end

    it 'displays the form Amount field' do
      expect(page).to have_field(placeholder: 'Amount')
    end

    it 'displays the form categories checkboxes' do
      expect(page).to have_field("category_#{category.id}")
    end

    it 'displays the Create Payment button' do
      expect(page).to have_button('Create Payment')
    end
  end
end
