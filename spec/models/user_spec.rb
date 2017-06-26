require 'rails_helper'

RSpec.describe User, type: :model do
  user = FactoryGirl.create :user

  describe 'validation' do
    it 'validates the email' do
      expect(ValidatesEmailFormatOf::validate_email_format(user.email)).to be_nil
      user.email = "hello"
      email_err = ["does not appear to be a valid e-mail address"]
      expect(ValidatesEmailFormatOf::validate_email_format(user.email)).to eq email_err
    end
  end
end
