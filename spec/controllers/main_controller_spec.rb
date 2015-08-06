RSpec.describe MainController do
  describe "#home" do
    it "responds successfully with an http status code of 200" do
      get :home
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the home template" do
      get :home
      expect(response).to render_template(:home)
    end

    it "loads particpating campuses." do
      @campus_1 = create(:campus)
      @campus_2 = create(:campus)
      @campus_3 = create(:campus)
      get :home
      expect(assigns(:campuses)).to match_array([@campus_1, @campus_2, @campus_3])
    end

    it "loads news articles" do
      @news_article_1, @news_article_2 = create(:news_article), create(:news_article)
      get :home
      expect(assigns(:news_articles)).to match_array([@news_article_2, @news_article_1])
    end
  end

  describe "#about" do
    it "responds successfully with an http status code of 200" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the about template" do
      get :about
      expect(response).to render_template(:about)
    end
  end

  describe "#students" do
    it "responds successfully with an http status code of 200" do 
      get :students
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the students template" do
      get :students
      expect(response).to render_template(:students)
    end
  end

  describe "#faculty" do
    it "responds successfully with an http status code of 200" do 
      get :faculty
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the faculty template" do
      get :faculty
      expect(response).to render_template(:faculty)
    end
  end

  describe "#terms" do
    it "responds successfully with an http status code of 200" do
      get :terms
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the terms template" do
      get :terms
      expect(response).to render_template(:terms)
    end
  end

  describe "#faq" do
    it "responds successfully with an http status code of 200" do
      get :faq
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the faq template" do
      get :faq
      expect(response).to render_template(:faq)
    end
  end

  describe "#supporters" do
    it "responds successfully with an http status code of 200" do
      get :supporters
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the supporters template" do
      get :supporters
      expect(response).to render_template(:supporters)
    end
  end

  describe "#partners" do
    it "responds successfully with an http status code of 200" do
      get :partners
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the partners template" do 
      get :partners
      expect(response).to render_template(:partners)
    end
  end
end
