require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) { User.new(email: "something@gmail.com", password: "password")}

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it {should validate_presence_of(:password_digest)}
    it (should validate_length_of(:password).is_at_least(6))
  end

  describe '#is_password?' do
    it "returns true for matching password" do
      expect(user.is_password?("password")).to be true
    end

    it "returns false if input is not the user's password" do
      expect(user.is_password?("something")).to be false
    end
  end

  describe "self.find_by_credentials" do
    before { user.save!}

    it 'returns the user if credentials match' do
      expect(User.find_by_credentials("something@gmail.com", "password")).to eq(user)
    end
  end

end
