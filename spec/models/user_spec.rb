RSpec.describe User do
  
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

    it "should validate presence of a passowrd_confirmation only on create" do
      @user = build(:user, password_confirmation: nil)
      expect(@user.valid?).to be false
    end

    it "should validate password_confirmation matches password" do
      @user = build(:user, password_confirmation: "not match")
      expect(@user.valid?).to be false
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

  describe "Auth Token Generation" do
    it "should generate an auth_token on user creation" do
      @user = create(:user)
      expect(@user.auth_token).to_not be_nil
    end
  end

  describe "Activation Token Generation" do
    it "should generate an activation token on user creation" do
      @user = create(:user)
      expect(@user.activation_token).to_not be_nil
    end
  end
end
