RSpec.describe User do
  let(:user) { create(:user) }  
  describe "validations" do
    it "should validate presence of first_name" do
      @user = build(:user, first_name: nil)
      expect(@user.valid?).to be false
    end

    it "should validate the length of first_name to be atleast 2 characters" do 
      @user = build(:user, first_name: "a")
      expect(@user.valid?).to be false
    end

    it "should validate the length of first_name is no more than 50 characters" do 
      @user = build(:user, first_name: "asdfadsfadjskfladsjlfkajdsflkadsjflkadsjfkladsjflkadsjfklad;jsfkladsjfkladsfjklad;sfjkladsfjka")
      expect(@user.valid?).to be false
    end

    it "should validate presence of last_name" do
      @user = build(:user, last_name: nil)
      expect(@user.valid?).to be false
    end

    it "should validate the length of last_name to be atleast 2 characters" do
      @user = build(:user, last_name: "a")
      expect(@user.valid?).to be false
    end

    it "should validate the length of last_name is no more than 50 characters" do
      @user = build(:user, last_name: "adjfkladskfjadsklfjdaslf;kjadslfkadslfjadsflajdsfladsjfladksfj")
      expect(@user.valid?).to be false
    end

    it "should validate presence of email" do
      @user = build(:user, email: nil)
      expect(@user.valid?).to be false
    end

    it "should validate uniqueness of email" do
      @user_1 = create(:user)
      @user_2 = build(:user, email: @user_1.email)
      expect(@user_2.valid?).to be false
    end

    it "should validate format of email" do
      @user = build(:user, email: "@buba@not-valid@.@com")
      expect(@user.valid?).to be false
    end

    it "should validate presence of a password" do
      @user = build(:user, password: nil)
      expect(@user.valid?).to be false
    end

    it "should validate the length of a password is atleast 6 characters" do
      @user = build(:user, password: "a", password_confirmation: "a")
      expect(@user.valid?).to be false
    end

    it "should validate presence of a passowrd_confirmation when password is set" do
      @user = build(:user, password_confirmation: nil)
      expect(@user.valid?).to be false
    end

    it "should validate password_confirmation matches password" do
      @user = build(:user, password_confirmation: "not match")
      expect(@user.valid?).to be false
    end
  end

  describe "associations" do
    it "has many module_author_associations" do
      is_expected.to have_many(:module_author_associations).with_foreign_key('author_id')
    end
    it "has many author_modules" do
      is_expected.to have_many(:author_modules).class_name('UdlModule').through(:module_author_associations).source('module')
    end
    it "has many module_faculty_associations" do
      is_expected.to have_many(:module_faculty_associations).with_foreign_key('faculty_id')
    end
    it "has many faculty_modules" do
      is_expected.to have_many(:faculty_modules).class_name('UdlModule').through(:module_faculty_associations).source('module')
    end
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
      @user = create(:user)
      @guaranteed_user = User.guaranteed_find_by email: @user.email
      expect(@guaranteed_user).to be_a(User)
    end
    it "should return a nulluser if no user is found" do
      @guaranteed_user = User.guaranteed_find_by email: 'noone@example.com'
      expect(@guaranteed_user).to be_a(NullUser)
    end
  end

  describe "#update" do
    before(:each) do
      @user = create(:user)
    end
    it "should not require password_confirm to update a record" do
      @user.update(password_confirmation: nil)
      expect(@user.valid?).to be true
    end

    it "should not require password to update a record" do
      @user_2 = User.find_by_email(@user.email)
      @user_2.first_name = "first_name"
      expect(@user_2.valid?).to be true
    end
  end

  describe "#authenticate" do       
    it "should authenticate a user by and password" do
      @user = create(:user)
      expect(@user.authenticate(@user.password)).to be @user
    end

    it "should not authenticate a user with an incorrect password" do
      @user = create(:user)
      expect(@user.authenticate("not_correct_password")).to be false
    end
  end

  describe "#generate_password_reset" do
    before(:each) do
      @user = create(:user)
    end
    it "should timestamp the generation of reset_password_token" do
      @user.generate_password_reset
      expect(@user.password_reset_sent_at).to_not be_nil
    end
  end

  describe "#reset_password" do
    before(:each) do
      @user = create(:user)
      @user.generate_password_reset
    end
    context "with valid parameters"do
      it "should update password" do
        @user.reset_password password: "testpass", password_confirmation: "testpass"
        expect(@user.authenticate("testpass")).to be @user
      end
      it "should set password_reset_token to nil" do
        @user.reset_password password: "testpass", password_confirmation: "testpass"
        expect(@user.password_reset_token).to be_nil
      end
    end
    context "with invalid parameters" do
      it "should not save an invalid password" do
        @user.reset_password password: "t", password_confirmation: "t"
        expect(@user.valid?).to be_falsey
      end
      it "should confirm password" do
        @user.reset_password password: "testpass", password_confirmation: "mytestpass"
        expect(@user.valid?).to be_falsey
      end
      it "should require password_confirmation" do
        @user.reset_password password: "testpass"
        expect(@user.valid?).to be_falsey
      end
      it "should not pass validation with empty string password_confirmation" do
        @user.reset_password password: "testpass", password_confirmation: ""
        expect(@user.valid?).to be_falsey
      end
    end
  end

  describe "Token Generation" do
      subject(:user) { create(:user) }
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

  describe "#prepare_email" do
    subject(:user) { create(:user_with_uppercase_email) }
    it "should return a downcased user email" do
      expect(user.email).to eq(user.email.downcase)
    end
  end
end
