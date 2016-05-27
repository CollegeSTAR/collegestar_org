RSpec.describe MainController do
  describe "#home" do
    it "responds successfully with an http status code of 200" do
      get :home
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#about" do
    it "responds successfully with an http status code of 200" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#students" do
    it "responds successfully with an http status code of 200" do 
      get :students
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#faculty" do
    it "responds successfully with an http status code of 200" do 
      get :faculty
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#terms" do
    it "responds successfully with an http status code of 200" do
      get :terms
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#faq" do
    it "responds successfully with an http status code of 200" do
      get :faq
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#supporters" do
    it "responds successfully with an http status code of 200" do
      get :supporters
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "#partners" do
    it "responds successfully with an http status code of 200" do
      get :partners
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
