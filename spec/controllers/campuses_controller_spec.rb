RSpec.describe CampusesController do
  describe "GET #index" do
    it "reponds successfully with http status code 200." do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should render index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "should assign all campuses to @campuses" do
      @campus_1, @campus_2 = create(:campus), create(:campus)
      get :index
      expect(assigns(:campuses)).to match_array([@campus_1, @campus_2])
    end

    it "should assign news articles to @news_articles" do
      @news_article_1, @news_article_2 = create(:news_article), create(:news_article)
      get :index
      expect(assigns(:news_articles)).to match_array([@news_article_2, @news_article_1])
    end
  end

  describe "GET #show" do
    before(:each) do
      @campus = create(:campus)
      get :show, slug: @campus
    end
    
    it "responds successfully with http status code 200." do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
      
    it "renders the show template" do
      expect(response).to render_template(:show)
    end

    it "assigns the campus with provided slug to @campus" do
      expect(assigns(:campus)).to eq(@campus)
    end
  end

  describe "GET #new" do
    it "responds successfully with HTTP status code 200" do
      get :new
      expect(response).to be_successful
      expect(response).to have_http_status(200)
    end

    it "renders the new template" do 
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "redirects to campus show page for new event." do
        post :create, campus: FactoryGirl.attributes_for(:campus)
        expect(response).to redirect_to Campus.last
      end
    end

    context "with invalid attributes" do
      it "re-renders the new_news_article template" do
        post :create, campus: FactoryGirl.attributes_for(:campus, name: nil)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    before(:each) do
      @campus = create(:campus)
      get :edit, slug: @campus
    end
    it "responds successfully with an HTTP 200 status code" do 
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should load edit template" do 
      expect(response).to render_template("edit")
    end
  end

  describe "PATCH #update" do
    let(:attr) do
      FactoryGirl.attributes_for(:campus, name: "Test Campus")
    end

    before(:each) do
      @campus = create(:campus)
      patch :update, slug: @campus, campus: attr
      @campus.reload
    end

    it "redirects to #show @campus upon update" do
      expect(response).to redirect_to @campus
    end
  end

  describe "DELETE #destroy" do
    before(:each) do 
      @campus = create(:campus)
      delete :destroy, slug: @campus
    end
    
    it "responds successfully with status code 303" do
      expect(response).to have_http_status(303)
    end

    it "redirects to #index action" do
      expect(response).to redirect_to campuses_path( notice: "The campus was removed." )
    end

    it "removes campus from database" do
      expect(Campus.count).to eq(0)
    end
  end
end
