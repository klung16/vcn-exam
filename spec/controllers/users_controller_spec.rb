require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before (:each) do
    @user = FactoryGirl.create :user
  end

  describe 'GET index' do
    it 'creates an array of users' do
      get :index
      expect(assigns(:users)).to eq([@user])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'does not render the wrong template' do
      get :index
      expect(response).not_to render_template('new')
    end
  end

  describe 'GET new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'does not render the wrong template' do
      get :new
      expect(response).not_to render_template('index')
    end
  end
end
