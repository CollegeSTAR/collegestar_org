require 'rails_helper'

RSpec.describe PasswordResetsController do
  describe "#new" do
    before(:each) do
      get :new
    end
    it "responds successfully with http status of 200" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#create" do
    context "with a registered email address" do
      before(:each) do
        @user = create(:user)
      end
      it "responds with redirect" do
        post :create, user: { email: @user.email }
        expect(response).to have_http_status(302)
      end
      it "should redirect to new_password_reset_path" do
        post :create, user: { email: @user.email }
        expect(response).to redirect_to( new_password_reset_path )
      end
      it "should create user#password_reset token" do
        post :create, user: { email: @user.email }
        @verify_user = User.find(@user.id)
        expect(@verify_user.password_reset_token).to_not be_nil
      end
    end
    context "with an unregistered email address" do

    end
  end

  describe "#update" do
    before(:each) do
      @user = create(:user)
      @user.generate_password_reset
      @user.save
    end
    it "should send a confirmation email" do
      mailer_double = instance_double("Mailer", deliver: true)
      expect(PasswordResetMailer).to receive(:reset_confirmation).with(@user).and_return( mailer_double )
      expect(mailer_double).to receive(:deliver_now)
      patch :update, id: @user.password_reset_token, user: { password: 'testing_password', password_confirmation: 'testing_password' }
    end
  end
end
