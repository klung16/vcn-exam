require 'rails_helper'

RSpec.describe User, type: :model do
  before (:each) do
    @user = FactoryGirl.create :user
  end

  describe 'validation' do

    context 'when the name is valid' do
      it 'accepts the name' do
        expect(@user).to be_valid
      end
    end

    context 'when the name is invalid' do
      it 'rejects the name' do
        @user.name = ""
        expect(@user).not_to be_valid
      end
    end

    context 'when the email is valid' do
      it 'accepts the email' do
        expect(@user).to be_valid
      end
    end

    context 'when the email is invalid' do
      it 'rejects the email' do
        @user.email = "hello@"
        expect(@user).not_to be_valid
        @user.name = ""
        expect(@user).not_to be_valid
      end
    end

    context 'when the address is valid' do
      it 'accepts the address' do
        expect(@user).to be_valid
      end
    end

    context 'when the address is invalid' do
      it 'rejects the address' do
        @user.address = ""
        expect(@user).not_to be_valid
      end
    end

    context 'when the message is valid' do
      it 'accepts the message' do
        expect(@user).to be_valid
      end
    end

    context 'when the message is invalid' do
      it 'rejects the message' do
        @user.message = ""
        expect(@user).not_to be_valid
      end
    end
  end
end
