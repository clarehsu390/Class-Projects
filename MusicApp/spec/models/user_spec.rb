require 'spec_helper'

  describe User do
    subject(:user) do
      FactoryGirl.build(:user,
      email: "hello@example.com",
      password: "hello")
    end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password) }
end

describe "instance methods" do
  describe "#is_password?(password)" do
      it "verifies password" do
        expect(user.is_password?('hello')).to eq(true)
      end

      it "verifies password if not correct" do
        expect(user.is_password?('byebye')).to eq(false)
      end
    end

    describe "#reset_session_token!" do
      it "sets a new session token on the user" do
        user.valid?
        old_session_token = user.session_token
        user.reset_session_token!
        expect(old_session_token).to_not eq(user.session_token)
      end
    end
  end

  describe "class methods" do
    before { user.save! }
    it "finds user by good credentials" do
      expect(User.find_by_credentials('hello@example.com', 'hello')).to eq(user)
    end
    it "returns nil if user is not found" do
      expect(User.find_by_credentails('haha', 'oops')).to eq(nil)
    end
  end
