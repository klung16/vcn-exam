require 'rails_helper'

RSpec.describe "users/index", type: :view do

  context 'when the user is valid' do
    before (:each) do
      @user = FactoryGirl.create :user
      @users = User.all
      render
    end

    it 'displays the proper headers' do
      expect(rendered).to include("Enter new user information!")
      expect(rendered).to include("Display the last user's information:")
    end
    it 'displays user information correctly' do
      expect(rendered).to include("Name: #{@user.name.titleize}")
      expect(rendered).to include("Email Address: #{@user.email}")
      expect(rendered).to include("Mailing Address: #{@user.address.titleize}")
      expect(rendered).to include("Message: #{@user.message}")
    end
  end

  context 'when the user is invalid' do
    before (:each) do
      @user = FactoryGirl.create :user
      @users = []
      render
    end

    it 'displays the proper headers' do
      expect(rendered).to include("Enter new user information!")
      expect(rendered).not_to include("Display the last user's information:")
    end

    it 'does not display the user information' do
      expect(rendered).not_to include("Name: #{@user.name.titleize}")
      expect(rendered).not_to include("Email Address: #{@user.email}")
      expect(rendered).not_to include("Mailing Address: #{@user.address.titleize}")
      expect(rendered).not_to include("Message: #{@user.message}")
    end
  end
end
