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
    before(:each) do
      @event = create(:event)
      get :edit, slug: @event
    end

    it "responds successfully with an HTTP 200 status code" do 
           expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "should load edit template" do 
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
      it "does not save the evena to the database." do
        expect{
          post :create, event: FactoryGirl.attributes_for(:event, name: nil)
        }.to_not change(Event, :count)
      end
      
      it "re-renders the event new template" do
        post :create, event: FactoryGirl.attributes_for(:event, name: nil)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    let(:attr) do
      FactoryGirl.attributes_for(:event, name: "New Event")
    end

    before(:each) do
      @event = create(:event)
      patch :update, slug: @event, event: attr
      @event.reload
    end

    it "redirects to #show @event upon update" do
      expect(response).to redirect_to @event
    end
  end

  describe "DELETE #destroy" do
    before(:each) do 
      @event = create(:event)
      delete :destroy, slug: @event
    end
    
    it "responds successfully with status code 302" do
      expect(response).to have_http_status(302)
    end

    it "redirects to #index action" do
      expect(response).to redirect_to events_path
    end

    it "displays flash notice about deleted record" do
      expect(flash[:notice]).to eq("The event was removed.")
    end

    it "removes event from database" do
      expect(Event.count).to eq(0)
    end
  end


end
