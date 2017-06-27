require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET index' do
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
