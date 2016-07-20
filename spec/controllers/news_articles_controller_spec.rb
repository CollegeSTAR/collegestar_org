RSpec.describe NewsArticlesController do
  describe "GET #index" do
    let(:article_one) { create(:news_article) }
    let(:article_two) { create(:news_article) }
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do 
    it "responds successfully with an HTTP 200 status code" do
      @news_article = create(:news_article)
      get :show, params: { slug: @news_article }
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "Get #new" do
    context "while not authenticated" do
      it "should redirect to login_path" do
        get :new
        expect(response).to redirect_to(login_path)
      end
    end
    context "while authenticated" do
      before(:each) do
        @user = create(:admin_user)
        cookies[:auth_token] = @user.auth_token
      end
      it "responds successfully with an HTTP 200 status code" do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #edit" do
    before(:each) do
      @news_article = create(:news_article)
    end
    context "while not authenticated" do
      it "should redirect to login_path" do
        get :edit, params: { slug: @news_article }
        expect(response).to redirect_to(login_path)
      end
    end
    context "while authenticated" do
      before(:each) do
        @user = create(:admin_user)
        cookies[:auth_token] = @user.auth_token
        get :edit, params: { slug: @news_article }
      end

      it "responds successfully with an HTTP 200 status code" do 
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST #create" do
    context "while not authenticated" do
      it "should redirect to login_path" do
        post :create, params: { news_article: FactoryGirl.attributes_for(:news_article) }
        expect(response).to redirect_to(login_path)
      end
    end
    context "while authenticated" do
      before(:each) do
        @user = create(:admin_user)
        cookies[:auth_token] = @user.auth_token
      end
      context "with valid attributes" do
        it "creates a new contact" do
          expect{
            post :create, params: { news_article: FactoryGirl.attributes_for(:news_article) }
          }.to change(NewsArticle, :count).by(1) 
        end

        it "redirects to news_articles show page for new article." do
          post :create, params: { news_article: FactoryGirl.attributes_for(:news_article) }
          expect(response).to redirect_to NewsArticle.last
        end  
      end

      context "with invalid attributes" do
        it "does not save the news_article to the database." do
          expect{
            post :create, params: { news_article: FactoryGirl.attributes_for(:news_article, title: nil) }
          }.to_not change(NewsArticle, :count)
        end
      end
    end
  end

  describe "PATCH #update" do
    let(:attr) do
      FactoryGirl.attributes_for(:news_article, title: "Test News Article")
    end

    before(:each) do
      @news_article = create(:news_article)
          end
    context "while not authenticated" do
      it "should redirect to login_path" do
        patch :update, params: { slug: @news_article, news_article: attr }
        expect(response).to redirect_to(login_path)
      end
    end
    context "while authenticated" do
      before(:each) do
        @user = create(:admin_user)
        cookies[:auth_token] = @user.auth_token
        patch :update, params: { slug: @news_article, news_article: attr }
        @news_article.reload
      end

      it "Displays flash message about article update." do
        expect(flash[:notice]).to eq("Successfully updated article.")
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do 
      @news_article = create(:news_article)
    end

    context "while not authenticated" do
      it "redirects to login_path" do
        delete :destroy, params: { slug: @news_article }
        expect(response).to redirect_to(login_path)
      end
    end
    context "while authenticated" do
      before(:each) do
        @user = create(:admin_user)
        cookies[:auth_token] = @user.auth_token
        delete :destroy, params: { slug: @news_article }
      end
      it "responds successfully with status code 302" do
        expect(response).to have_http_status(302)
      end

      it "redirects to #index action" do
        expect(response).to redirect_to news_articles_path
      end

      it "show flash notice about deleted record." do
        expect(flash[:notice]).to eq("The Article was removed.")
      end

      it "removes news_article from database" do
        expect(NewsArticle.count).to eq(0)
      end
    end
  end
end
