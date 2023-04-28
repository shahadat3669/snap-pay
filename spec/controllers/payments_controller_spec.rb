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

    context 'when not logged in' do
      it 'redirects to the login page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end

      it 'returns http redirect' do
        get :new

        expect(response).to have_http_status(:redirect)
      end
    end
  end

  describe 'POST #create' do
    let(:author) { User.create(name: 'Shahadat Hossain', email: 'shahadat@example.com', password: '12345678') }
    let(:category) { Category.create(name: 'Category 1', user: author) }

    context 'when user is logged in' do
      before { sign_in author }

      context 'with valid attributes' do
        let(:payment_param) { { payment: { name: 'Test Payment', amount: 100, category_ids: [category.id] } } }

        it 'creates a new payment' do
          expect { post :create, params: payment_param }
            .to change(Payment, :count).by(1)
        end

        it 'redirects to the categories page' do
          post :create, params: payment_param

          expect(response).to redirect_to(categories_path)
        end
      end

      context 'with invalid attributes' do
        let(:payment_param) { { payment: { name: '', author_id: author.id, categories: [category.id] } } }

        it 'does not create a new payment' do
          expect { post :create, params: payment_param }
            .not_to change(Payment, :count)
        end

        it 'renders the new template' do
          post :create, params: payment_param

          expect(response).to render_template(:new)
        end
      end
    end

    context 'when user is not logged in' do
      let(:payment_param) { { payment: { name: 'Test Payment', author_id: author.id, categories: [category.id] } } }

      it 'redirects to the sign in page' do
        post :create, params: payment_param

        expect(response).to redirect_to(new_user_session_path)
      end

      it 'does not create a new payment' do
        expect { post :create, params: payment_param }
          .not_to change(Payment, :count)
      end
    end
  end
end
