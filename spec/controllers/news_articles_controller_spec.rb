RSpec.describe NewsArticlesController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "loads all news_articles into @articles" do
      @article_1, @article_2 = create(:news_article), create(:news_article)
      get :index

      expect(assigns(:news_articles)).to match_array([@article_1, @article_2])
    end
  end

  describe "GET #show" do 
    it "responds successfully with an HTTP 200 status code" do
      @news_article = create(:news_article)
      get :show, slug: @news_article
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should load the correct news_article" do
      @news_article = create(:news_article)
      get :show, slug: @news_article
      expect(assigns(:news_article)).to eq(@news_article)
    end
  end

  describe "Get #new" do
    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should load the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do 
      @news_article = create(:news_article)
      get :edit, slug: @news_article
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should load edit template" do 
      @news_article = create(:news_article)
      get :edit , slug: @news_article
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new contact" do
        expect{
          post :create, news_article: FactoryGirl.attributes_for(:news_article)
        }.to change(NewsArticle, :count).by(1) 
      end

      it "redirects to news_articles show page for new article." do
        post :create, news_article: FactoryGirl.attributes_for(:news_article)
        expect(response).to redirect_to NewsArticle.last
      end  
    end

    context "with invalid attributes" do
      it "does not save the news_article to the database." do
        expect{
          post :create, news_article: FactoryGirl.attributes_for(:news_article, title: nil)
        }.to_not change(NewsArticle, :count)
      end

      it "re-renders the new_news_article template" do
        post :create, news_article: FactoryGirl.attributes_for(:news_article, title: nil)
        expect(response).to render_template(:new)
      end
    end
  end
end
