require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :feature do
  let(:user) { User.create(name: 'Shahadat Hossain', email: 'shahadat3669@gmail.com', password: '12345678') }
  let(:icon) { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'placeholder.png'), 'image/png') }

  let(:category) { Category.create(name: 'Category 1', icon:, user:) }
  let(:payment) { Payment.create(name: 'Test Payment', amount: 100, author_id: user.id, category_ids: [category.id]) }

  before do
    sign_in user
    visit categories_path
  end

  it 'displays the correct page title' do
    expect(page).to have_content('Categories')
  end

  it 'displays the Create Payment button' do
    expect(page).to have_content('NEW CATEGORY')
  end
end
