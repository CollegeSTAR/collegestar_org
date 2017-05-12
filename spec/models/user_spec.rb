require 'spec_helper'

RSpec.describe User do
  let(:user) { create(:user) }  
  let(:owned_and_released_faculty_udl_module) { create(:udl_module, released: true) }
  let(:owned_and_released_author_udl_module) { create(:udl_module, released: true) }
  let(:owned_faculty_udl_module) { create(:udl_module, released: false) }
  let(:owned_author_udl_module) { create(:udl_module, released: false) }

  let(:non_owned_udl_module) { create(:udl_module) }

  describe "validations" do
    subject { build(:user) }
    it { should validate_presence_of(:first_name) }
    it { should validate_length_of(:first_name).is_at_least(2).is_at_most(50) }
    it { should validate_presence_of(:last_name) }
    it { should validate_length_of(:last_name).is_at_least(2).is_at_most(50) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should allow_value('jane.smith@example.com').for(:email) }
    it { should_not allow_value('jane.smith@@example.com').for(:email) }
  end

  describe "password validations" do
    subject { build(:user, password: nil) }
    it { should have_secure_password }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(8) }
    it { should validate_confirmation_of(:password).on(:create) }
  end

  describe "associations" do
    it { should have_many(:module_author_associations).with_foreign_key('author_id') }
    it { should have_many(:author_modules).class_name('UdlModule').through(:module_author_associations).source('module') }
    it { should have_many(:module_faculty_associations).with_foreign_key('faculty_id') }
    it { should have_many(:faculty_modules).class_name('UdlModule').through(:module_faculty_associations).source('module') }
    it { should have_many(:roles) }
  end

  describe "#full_name" do
    it "should return a combined title, first_name, and last_name" do
      user
      expect(user.full_name).to eq("#{user.title} #{user.first_name} #{user.last_name}")
    end
    context "No title set" do
      it "correctly formats full name" do
        user.title = nil
        expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
      end
    end
  end

  describe "#guaranteed_find_by" do
    it "should return a normal user if one is found" do
      guaranteed_user = User.guaranteed_find_by email: user.email
      expect(guaranteed_user).to be_a(User)
    end
    it "should return a nulluser if no user is found" do
      guaranteed_user = User.guaranteed_find_by email: 'noone@example.com'
      expect(guaranteed_user).to be_a(NullUser)
    end
  end

  describe "#generate_password_reset" do
    before(:each) { user }

    it "should timestamp the generation of reset_password_token" do
      user.generate_password_reset
      expect(user.password_reset_sent_at).to_not be_nil
    end
  end

  describe "#reset_password" do
    before(:each) do
      user
      user.generate_password_reset
    end
    context "with valid parameters"do
      it "should update password" do
        user.reset_password password: "testpass", password_confirmation: "testpass"
        expect(user.authenticate("testpass")).to be user
      end
      it "should set password_reset_token to nil" do
        user.reset_password password: "testpass", password_confirmation: "testpass"
        expect(user.password_reset_token).to be_nil
      end
    end
    context "with invalid parameters" do
      it "should not save an invalid password" do
        user.reset_password password: "t", password_confirmation: "t"
        expect(user.valid?).to be_falsey
      end
      it "should confirm password" do
        user.reset_password password: "testpass", password_confirmation: "mytestpass"
        expect(user.valid?).to be_falsey
      end
      it "should require password_confirmation" do
        user.reset_password password: "testpass"
        expect(user.valid?).to be_falsey
      end
      it "should not pass validation with empty string password_confirmation" do
        user.reset_password password: "testpass", password_confirmation: ""
        expect(user.valid?).to be_falsey
      end
    end
  end

  describe "Token Generation" do
    before(:each) { user }
 
    it "should generate an auth_token on user creation" do
      expect(user.auth_token).to_not be_nil
    end

    it "should generate an activation token on user creation" do
      expect(user.activation_token).to_not be_nil
    end

    it "should generate a password reset token on user#send_password_reset" do
      user.generate_password_reset
      expect(user.password_reset_token).to_not be_nil
    end
  end

  describe "#has_role?" do
    let(:admin_user) { create(:admin_user) }
    let(:non_admin_user) { create(:user) }

    context "with requested role" do
      it "should return true with a single symbol" do
        expect( admin_user.has_role? :admin ).to be_truthy
      end
      it "should return true with an array of symbols" do
        expect( admin_user.has_role? [ :modules_admin, :admin ] ).to be_truthy
      end
    end
    context "without requested role" do
      it "should return false" do
        expect(non_admin_user.has_role? :admin).to be_falsey
      end
    end
  end

  describe "#released_modules" do
    before(:each) do
      user.faculty_modules << owned_and_released_faculty_udl_module
      user.faculty_modules << owned_faculty_udl_module
      user.author_modules << owned_and_released_author_udl_module
      user.author_modules << owned_author_udl_module
      non_owned_udl_module
    end
    it "returns only user's released modules" do
      expect(user.released_modules).to match_array(
        [
          owned_and_released_faculty_udl_module, 
          owned_and_released_author_udl_module
        ]
      )
    end
    it "returns only user's unreleased modules" do
      expect(user.unreleased_modules).to match_array(
        [
          owned_faculty_udl_module, 
          owned_author_udl_module
        ]
      )

    end
  end

  describe "#prepare_email" do
    subject(:user) { create(:user_with_uppercase_email) }
    it "should return a downcased user email" do
      expect(user.email).to eq(user.email.downcase)
    end
  end
end
