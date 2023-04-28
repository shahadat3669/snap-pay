require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:user) { User.create(name: 'Shahadat Hossain', email: 'shahadat3669@gmail.com', password: '12345678') }
  let(:icon) { fixture_file_upload(Rails.root.join('app', 'assets', 'images', 'placeholder.png'), 'image/png') }

  describe 'GET #index' do
    context 'when user is logged in' do
      before { sign_in user }

      it 'assigns @user' do
        get :index

        expect(assigns(:user)).to eq(user)
      end

      it 'assigns @categories' do
        category1 = Category.create(name: 'Category 1', user:)
        category2 = Category.create(name: 'Category 2', user:)

        get :index

        expect(assigns(:categories)).to match_array([category1, category2])
      end

      it 'renders the index template' do
        get :index

        expect(response).to render_template('index')
      end

      it 'returns http success' do
        get :index

        expect(response).to have_http_status(:success)
      end
    end

    context 'when user is not logged in' do
      it 'redirects to the sign in page' do
        get :index

        expect(response).to redirect_to(new_user_session_path)
      end

      it 'returns http redirect' do
        get :index

        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'GET #show' do
    let(:category) { Category.create(name: 'Category 1', icon:, user:) }
    let(:payment1) { Payment.create(name: 'Test Payment', amount: 10.0, author: user, categories: [category]) }
    let(:payment2) { Payment.create(name: 'Test Payment2', amount: 5.0, author: user, categories: [category]) }

    context 'when user is logged in' do
      before { sign_in user }

      it 'assigns the requested category as @category' do
        get :show, params: { id: category.id }
        expect(assigns(:category)).to eq(category)
      end

      it 'assigns the category payments as @payments' do
        get :show, params: { id: category.id }
        puts "payment1 #{payment1.attributes}"
        expect(assigns(:payments)).to match_array([payment1, payment2])
      end

      it 'renders the show template' do
        get :show, params: { id: category.id }
        expect(response).to render_template(:show)
      end

      it 'returns http success' do
        get :show, params: { id: category.id }

        expect(response).to have_http_status(:success)
      end
    end
  end
end
