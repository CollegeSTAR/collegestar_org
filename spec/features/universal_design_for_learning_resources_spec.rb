require 'spec_helper'

RSpec.feature "UDL Resource Management" do
  
  let(:udl_resource) { create(:universal_design_for_learning_resource, published: true) }
  let(:unpublished_udl_resource) { create(:unviersal_design_for_learning_resource) }
  
  feature "UDL Resource non-admin" do
    before(:each) do
      udl_resource
    end
    scenario "Visit UDL Resource index" do
      visit "/universal-design-for-learning"
      
      expect(page).to have_content(udl_resource.title)
    end
    scenario "Visit UDL Resource page" do
      visit "/universal-design-for-learning/#{udl_resource.slug}"

      expect(page).to have_content(udl_resource.content)
    end
  end

  feature "Admin resource Management" do
    context "While logged in with appropriate credintials" do
      let(:udl_resources_admin) { create(:udl_resources_admin_user) }
      before(:each) do
        #login
        visit "/login"
        fill_in "Email", with: udl_resources_admin.email
        fill_in "Password", with: udl_resources_admin.password
        click_button "Log In"
      end

      scenario "Add new resource" do
        visit "/universal-design-for-learning/new"
        fill_in "Title", with: "Resource Title"
        fill_in "Description", with: "This is the description"
        fill_in "Page Content", with: "This is the resource's content."
        click_button "Create new resource"

        expect(page).to have_content("Successfully created Universal Design for Learning Resource")
        expect(page).to have_content("Resource Title")
      end

      scenario "Edit resource" do
        visit "/universal-design-for-learning/#{udl_resource.slug}/edit"
        fill_in "Page Content", with: "The edited page content"
        click_button "Update UDL resource"
        
        expect(page).to have_content("Successfully updated Universal Design for Learning Resource")
        expect(page).to have_content("The edited page content")    
      end
    end

    context "While not logged in" do
      scenario "Add new resource" do
        visit "/universal-design-for-learning/new"

        expect(current_path).to eq(login_path)
      end
      scenario "Edit resource" do
        visit "/universal-design-for-learning/#{udl_resource.slug}/edit"

        expect(current_path).to eq(login_path)
      end
    end
  end
end
