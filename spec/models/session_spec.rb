require 'rails_helper'

RSpec.describe Session do
  describe "#create" do
    context "with correct params" do
      before(:each) do
        @user = create(:user)
        @user_attributes = attributes_for(:user)
      end
      it "should return a new Session object" do
        @session = Session.create email: @user.email, password: @user_attributes[:password]
        expect(@session).to be_a(Session)
      end
      context "with no remember" do
        before(:each) do
          @session = Session.create email: @user.email, password: @user_attributes[:password]
        end
        it "should set session#auth_token to user#auth_token" do
          expect(@session.auth_token).to eq(@user.auth_token)
        end
        it "should set session#permanent to false" do
          expect(@session.permanent).to eq(false)
        end
      end
      context "with remember" do
        before(:each) do
          @session = Session.create email: @user.email, password: @user_attributes[:password], permanent: 1 
        end
        it "should set session#permanent to truthy" do
          expect(@session.permanent).to be_truthy
        end
      end
      context "with incorrect params" do
        it "should return a NullSession if email is incorrect" do
          @session = Session.create email: 'not_correct@example.com', password: 'wrong'
          expect(@session).to be_a(NullSession)
        end
        it "should return a NullSession if password is incorrect" do
          @user = create(:user)
          @session = Session.create email: @user.email, password: 'wrong'
          expect(@session).to be_a(NullSession)
        end
        it "should set auth_token to falsey" do
          @session = Session.create email: 'not_correct@example.com', password: 'wrong'
          expect(@session.auth_token).to be_falsey
        end
      end
    end

    describe "#persist" do
      before(:each) do
        @user = create(:user)
        @user_attributes = attributes_for(:user)
      end
      context "with no remember" do 
        before(:each) do
          @cookies = {}
          @session = Session.create email: @user.email, password: @user_attributes[:password]
        end
        it "should add auth_token to regular cookie" do
          @session.persist(@cookies)
          expect(@cookies).to have_key(:auth_token)
        end
        it "should set auth_token equal to user.auth_token" do
          @session.persist(@cookies)
          expect(@cookies[:auth_token]).to eq(@user.auth_token)
        end
      end
      context "with remember me" do
        before(:each) do
          @cookies = double("Cookies", permanent: {})
          @session = Session.create email: @user.email, password: @user_attributes[:password], permanent: 1
        end
        it "should add auth_token to permanent cookie" do
          @session.persist(@cookies)
          expect(@cookies.permanent).to have_key(:auth_token)
        end
        it "should set auth_token equal to user.auth_token" do
          @session.persist(@cookies)
          expect(@cookies.permanent[:auth_token]).to eq(@user.auth_token)
        end
      end
    end
  end

  describe "#destroy" do
    before(:each) do
      @user = create(:user)
      @user_attributes = attributes_for(:user)
      @cookies = double()
      @session = Session.create email: @user.email, password: @user_attributes[:password]
    end
    it "should send delete message to cookies object" do
      expect(@cookies).to receive(:delete).with(:auth_token)
      Session.destroy(@cookies)
    end
  end
end
