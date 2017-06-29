require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before (:each) do
    @user = User.new
  end

  context 'when page is loaded' do
    it 'displays the user information form' do
      render
      expect(rendered).to include("Enter the user information")
      expect(rendered).to include("Full Name:")
      expect(rendered).to include("Email Address:")
      expect(rendered).to include("Mailing Address:")
      expect(rendered).to include("Message")
      expect(rendered).to include("Would you like to donate $5 to the Vancouver Community Network?")
    end
  end
end
