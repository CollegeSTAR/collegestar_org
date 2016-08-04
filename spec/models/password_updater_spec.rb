require 'spec_helper'

RSpec.describe PasswordUpdater do
  let(:password_updater) { PasswordUpdater.new attributes_for(:password_updater) }  
  let(:user) { create(:user, password: "current_password", password_confirmation: "current_password") }
  let(:user_double) { instance_double("User", password: "current_password", password_confirmation: "current_password") }
  
  describe "#update_password" do
    it "authenticates user with current password" do
      expect(user_double).to receive(:authenticate).with(user_double.password)
      password_updater.update_password( user_double )
    end
    
    context "with correct user current_password" do
      it "returns true" do
        
        expect( password_updater.update_password(user) ).to be_truthy
      end

      context "with non-matching new password confirmation" do
        it "returns false" do
          password_updater = PasswordUpdater.new attributes_for(:password_updater, new_password_confirmation: "Not Correct Confirmation")
          expect( password_updater.update_password(user) ).to be_falsey
        end
      end
    end
    context "with incorrect user current_password" do
      it "returns false" do
        password_updater = PasswordUpdater.new attributes_for(:password_updater, current_password: "Not Correct Password")
        expect( password_updater.update_password(user) ).to be_falsey
      end
    end
  end
end
