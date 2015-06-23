RSpec.describe EventsController do
  describe "GET #index" do
    it "responds successfully with HTTP status code 200" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
      
    it "renders index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "laods all events into @events" do 
      @event_1, @event_2 = create(:event), create(:event)
      get :index
      expect(assigns(:events)).to match_array([@event_1, @event_2])
    end
  end

  describe "GET #show" do
    it "responds successfully with HTTP status code 200" do
      @event = create(:event)
      get :show, slug: @event
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    
    it "renders show template" do 
      @event = create(:event)
      get :show, slug: @event
      expect(response).to render_template(:show)
    end
    it "loads correct event into @event" do 
      @event = create(:event)
      get :show, slug: @event
      expect(assigns(:event)).to eq(@event)
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

  describe "GET #edit" do
    it "responds successfully with an HTTP 200 status code" do 
      @event = create(:event)
      get :edit, slug: @event
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should load edit template" do 
      @event = create(:event)
      get :edit , slug: @event
      expect(response).to render_template("edit")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the event to the database" do 
        expect{
          post :create, event: FactoryGirl.attributes_for(:event)
        }.to change(Event, :count).by(1) 
      end

      it "redirects to event show page for new event." do
        post :create, event: FactoryGirl.attributes_for(:event)
        expect(response).to redirect_to Event.last
      end
    end

    context "with invalid attributes" do
      it "does not save the news_article to the database." do
        expect{
          post :create, event: FactoryGirl.attributes_for(:event, name: nil)
        }.to_not change(Event, :count)
      end
      
      it "re-renders the new_news_article template" do
        post :create, event: FactoryGirl.attributes_for(:event, name: nil)
        expect(response).to render_template(:new)
      end
    end
  end
end
