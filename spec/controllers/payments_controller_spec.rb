require 'rails_helper'

RSpec.describe PaymentsController, type: :controller do
  describe 'GET #new' do
    let(:author) { User.create(name: 'Shahadat Hossain', email: 'shahadat@example.com', password: '12345678') }
    let(:category) { Category.create(name: 'Category 1', user: author) }

    context 'when logged in' do
      before { sign_in author }

      it 'assigns the user, categories, and a new payment as @user, @categories, and @payment' do
        get :new

        expect(assigns(:user)).to eq(author)
        expect(assigns(:categories)).to eq(author.categories)
        expect(assigns(:payment)).to be_a_new(Payment)
      end

      it 'renders the new template' do
        get :new

        expect(response).to render_template(:new)
      end

      it 'returns http success' do
        get :new

        expect(response).to have_http_status(:success)
      end
    end
  end
end
