RSpec.describe EventsController do
  describe "GET #index" do
    it "responds successfully with HTTP status code 200" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "responds successfully with HTTP status code 200" do
      @event = create(:event)
      get :show, slug: @event
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #new" do
    context 'while not authenticated' do
      it "responds with redirect to login" do
        get :new
        expect(response).to redirect_to(login_path)
      end
    end
    context "while authenticated" do
      before(:each) do
        @user = create(:admin_user)
        cookies[:auth_token] = @user.auth_token
      end
      it "responds successfully with http status code 200" do
        get :new
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #edit" do
    context "while not authenticated" do
      it "should redirect to login" do
        @event = create(:event)
        get :edit, slug: @event
        expect(response).to redirect_to(login_path)
      end
    end
    context " while authenticated" do
      before(:each) do
        @user = create(:admin_user)
        cookies[:auth_token] = @user.auth_token
        @event = create(:event)
        get :edit, slug: @event
      end
      it "responds successfully with an HTTP 200 status code" do 
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST #create" do
    context "while not authenticated" do
      it "should redirect to login_path if user is not authenticated" do
        post :create, event: FactoryGirl.attributes_for(:event)
        expect(response).to redirect_to(login_path)
      end
    end
    context "while authenticated" do
      before(:each) do
        @user = create(:admin_user)
        cookies[:auth_token] = @user.auth_token
      end
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
      end
    end
  end

  describe "PATCH #update" do
    let(:attr) do
      FactoryGirl.attributes_for(:event, name: "New Event")
    end
    before(:each) do
      @event = create(:event)
    end

    context "while not authenticated" do
      it "should redirect to login_path" do
        patch :update, slug: @event, event: attr
        expect(response).to redirect_to(login_path)  
      end
    end
    context "while authenticated" do
      before(:each) do
        @user = create(:admin_user)
        cookies[:auth_token] = @user.auth_token
        patch :update, slug: @event, event: attr
        @event.reload
      end
      it "redirects to #show @event upon update" do
        expect(response).to redirect_to @event
      end

      it "displays flash notice about updated record." do
        expect(flash[:notice]).to eq("Event was successfully updated.")
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do 
      @event = create(:event)
    end
    context "while not authenticated" do
      it "should redirect to login_path" do
        delete :destroy, slug: @event
        expect(response).to redirect_to(login_path)
      end
    end
    context "while authenticated" do
      before(:each) do
        @user = create(:admin_user)
        cookies[:auth_token] = @user.auth_token
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
end
