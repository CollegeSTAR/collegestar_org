require 'rails_helper'

RSpec.describe Faculty::ModuleProposalsController, type: :controller do
  let(:module_proposal) { create(:module_proposal) }
  it "creates a new ModuleProposal" do
    expect {
      post :create, module_proposal: attributes_for(:module_proposal)
    }.to change{ ModuleProposal.count}.by(1)
  end

  context "with incorrect params" do
    before {
      post :create, module_proposal: attributes_for(:module_proposal, first_name: "")
    }
    it { should set_flash[:error] }
  end

  context "not authorized redirects" do
    before(:each) do
      module_proposal
    end
    describe "Get #index" do
      it "should redirect to login" do
        get :index
        expect(response).to redirect_to(login_path)
      end
    end

    describe "Get #show" do
      it "should redirect to login" do
        get :show, id: module_proposal.id
        expect(response).to redirect_to(login_path)
      end
    end

    describe "Get #edit" do
      it "should redirect to login" do
        get :edit, id: module_proposal.id
        expect(response).to redirect_to(login_path)
      end
    end

    describe "Put #update" do
      it "should redirect to login" do
        put :update, id: module_proposal.id, module_proposal: attributes_for(:module_proposal, title: "The new title")
        expect(response).to redirect_to(login_path)
      end

      it "should not update the module proposal" do
        put :update, id: module_proposal.id, module_proposal: attributes_for(:module_proposal, title: "The new title")
        module_proposal.reload
        expect(module_proposal.title).to_not eq("The new title")
      end
    end

    describe "Delete Destroy" do
      it "should redirect to login" do
        delete :destroy, id: module_proposal
        expect(response).to redirect_to(login_path)
      end

      it "should not delete the record" do
        expect {
          delete :destroy, id: module_proposal
        }.to change{ ModuleProposal.count }.by(0)
      end
    end
  end

  context "While authenticated" do
    let(:module_proposals_admin) { create(:module_proposals_admin_user) }
    before(:each) do
      cookies[:auth_token] = module_proposals_admin.auth_token
    end
    
    describe "Put/Patch #update" do
      context "Successful update" do
        before do
          module_proposal
          put :update, id: module_proposal.id, module_proposal: attributes_for(:module_proposal, title: 'my new title')
          module_proposal.reload
        end
        it "redirects to #show" do
          expect(response).to redirect_to([:faculty, module_proposal])
        end
        it { should set_flash[:notice] }
      end
      context "Unsuccessful update" do
        before do
          module_proposal
          put :update, id: module_proposal.id, module_proposal: attributes_for(:module_proposal, title: nil)
          module_proposal.reload
        end
        it { should set_flash[:error] }
      end
    end

    describe "Delete #destroy" do
      it "should delete the given module proposal" do
        module_proposal
        expect{
          delete :destroy, id: module_proposal.id
        }.to change{ ModuleProposal.count }.by(-1)
      end
      
      context "Successfully deletes record" do
        before do
          module_proposal
          delete :destroy, id: module_proposal.id
        end
        it { should set_flash[:notice] }
      end
    end
  end
end
