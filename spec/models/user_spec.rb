require 'rails_helper'

RSpec.describe User, type: :model do
  user = FactoryGirl.create :user

  describe 'validation' do
    it 'validates the email' do
      expect(user).to be_valid
      user.email = "hello@"
      expect(user).not_to be_valid
      end
  end
end
