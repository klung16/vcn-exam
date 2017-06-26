require 'rails_helper'

RSpec.describe User, type: :model do
  @user = FactoryGirl.create :user

  describe 'validation' do
    it 'validates the email' do
      expect(ValidatesEmailFormatOf::validate_email_format(@user.email)).to be_nil
      @user.email = "hello"
      expect(ValidatesEmailFormatOf::validate_email_format(@user.email)).to eq "Not a valid email address!"
    end
  end
end
