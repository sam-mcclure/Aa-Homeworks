require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(email: 'bob@bob.com', password: 'password')}

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest)}
    it { should validate_length_of(:password).is_at_least(6)}
  end

  describe '::find_by_credentials' do
    it 'should return a user with a matching email and password' do
      user.save
      result = User.find_by_credentials(user.email, user.password)
      expect(result).to eq(user)
    end
    context 'with invalid parameters' do
      it "returns nil" do
        result = User.find_by_credentials("email", "password")
        expect(result).to eq(nil)
      end
    end
  end

  describe '#is_password?' do
    it 'returns true if password is correct' do
      expect(user.is_password?("password")).to be true
    end
  end

  describe '#reset_session_token!' do
    it 'gives user a new session token' do
      session_token = user.session_token
      expect(user.reset_session_token!).to_not eq(session_token)
    end
  end

end
