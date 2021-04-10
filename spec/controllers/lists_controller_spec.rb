require 'rails_helper'
begin
  require 'lists_controller'
rescue LoadError
end

if defined?(ListsController)
  RSpec.describe ListsController, type: :controller do
    let(:valid_attributes) do
      {
        name: 'Superhero'
      }
    end

    let(:invalid_attributes) do
      { name: '' }
    end

    describe 'index action' do
      before do
        get :index
      end

      it 'returns a succesfull response' do
        expect(response).to have_http_status(200)
      end

      it 'renders the index page' do
        expect(response).to render_template :index
      end

      it 'assigns all lists as @lists' do
        list = List.create! valid_attributes
        get :index, params: {}
        expect(assigns(:lists)).to eq([list])
      end
    end

    describe 'create action' do
      describe 'with valid params' do
        it 'creates a new List' do
          expect do
            post :create, params: { list: valid_attributes }
          end.to change(List, :count).by(1)
        end

        it 'assigns a newly created list as @list' do
          post :create, params: { list: valid_attributes }
          expect(assigns(:list)).to be_a(List)
          expect(assigns(:list)).to be_persisted
        end

        it 'redirects to the show page' do
          post :create, params: { list: valid_attributes }
          expect(response).to redirect_to(List.last)
        end
      end

      describe 'with invalid params' do
        it 'assigns a newly created but unsaved list as @list' do
          post :create, params: { list: invalid_attributes }
          expect(assigns(:list)).to be_a_new(List)
        end
      end
    end
  end
else
  describe 'ListsController' do
    it 'should exist' do
      expect(defined?(ListsController)).to eq(true)
    end
  end
end
