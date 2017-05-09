require 'spec_helper'

RSpec.feature "Module Management" do
  let(:udl_module) { create(:udl_module) }
  let(:udl_module_with_sections) { create(:udl_module_with_sections) }
  let(:module_admin) { create(:modules_admin_user) }

  feature "list all modules" do
    before(:each) do
      udl_module
      #login
      visit "/login"
      fill_in "Email", with: module_admin.email
      fill_in "Password", with: module_admin.password
      click_button "Log In"
    end

    scenario "visit udl modules page" do
      visit "/modules"
      
      expect(page).to have_content(udl_module.title)
    end
  end

  feature "add section to module" do

    context "not logged in with correct role" do
      scenario "attempt to add section" do
        visit "/modules/#{udl_module.slug}/sections/new?parent=introduction"
        expect(page).to have_text("Log In")
      end
    end
    
    context "Logged in with admin rights" do
      before(:each) do 
        #login
        visit "/login"
        fill_in "Email", with: module_admin.email
        fill_in "Password", with: module_admin.password
        click_button "Log In"
      end
      
      context "with a title" do
        scenario "attempt to add section" do
          visit "/modules/#{udl_module.slug}/sections/new?parent=introduction"
          fill_in "Title", with: "This is the section title"
          fill_in "udl_module_section_content", with: "This is the content"
          click_button "Save section"
          expect(page).to have_text("successfully created.")
        end
      end
      context "without a title" do
        scenario "add section" do
          visit "/modules/#{udl_module.slug}/sections/new?parent=introduction"
          fill_in "udl_module_section_content", with: "This is the content"
          click_button "Save section"
          expect(page).to_not have_text("successfully created.")
          expect(page).to have_css(".field_with_errors")
        end
      end

      scenario "add introduction section" do
        visit "/modules/#{udl_module.slug}"
        click_link("udl-module-add-introduction-section")
        fill_in "udl_module_section_title", with: "My intro section"
        fill_in "udl_module_section_content", with: "This is the intro content"
        click_button "Save section"

        visit "/modules/#{udl_module.slug}"
        expect(page).to have_content("My intro section")
      end    
      
      scenario "add module objectives section" do
        visit "/modules/#{udl_module.slug}"
        click_link("udl-module-add-module-objectives-section")
        fill_in "udl_module_section_title", with: "My module objectives section"
        fill_in "udl_module_section_content", with: "This is the module objectives content"
        click_button "Save section"

        visit "/modules/#{udl_module.slug}"
        expect(page).to have_content("My module objectives section")
      end
      
      scenario "add udl alignment section" do
        visit "/modules/#{udl_module.slug}"
        click_link("udl-module-add-udl-alignment-section")
        fill_in "udl_module_section_title", with: "My udl alignment section"
        fill_in "udl_module_section_content", with: "This is the udl alignment content"
        click_button "Save section"

        visit "/modules/#{udl_module.slug}"
        expect(page).to have_content("My udl alignment section")
      end
      
      scenario "add instructional practice section" do
        visit "/modules/#{udl_module.slug}"
        click_link("udl-module-add-instructional-practice-section")
        fill_in "udl_module_section_title", with: "My instructional practice section"
        fill_in "udl_module_section_content", with: "This is the instructional practice content"
        click_button "Save section"

        visit "/modules/#{udl_module.slug}"
        expect(page).to have_content("My instructional practice section")
      end
      
      scenario "add learn more section" do
        visit "/modules/#{udl_module.slug}"
        click_link("udl-module-add-learn-more-section")
        fill_in "udl_module_section_title", with: "My learn more section"
        fill_in "udl_module_section_content", with: "This is the learn more content"
        click_button "Save section"

        visit "/modules/#{udl_module.slug}"
        expect(page).to have_content("My learn more section")
      end
      
      scenario "add references section" do
        visit "/modules/#{udl_module.slug}"
        click_link("udl-module-add-references-section")
        fill_in "udl_module_section_title", with: "My references section"
        fill_in "udl_module_section_content", with: "This is the references content"
        click_button "Save section"

        visit "/modules/#{udl_module.slug}"
        expect(page).to have_content("My references section")
      end
      
      scenario "add about the author section" do
        visit "/modules/#{udl_module.slug}"
        click_link("udl-module-add-about-the-author-section")
        fill_in "udl_module_section_title", with: "My about the author section"
        fill_in "udl_module_section_content", with: "This is the about the author content"
        click_button "Save section"

        visit "/modules/#{udl_module.slug}"
        expect(page).to have_content("My about the author section")
      end
    end
  end

  feature "edit existing section" do
    before(:each) do 
      #login
      visit "/login"
      fill_in "Email", with: module_admin.email
      fill_in "Password", with: module_admin.password
      click_button "Log In"

      udl_module_with_sections
    end

    scenario "logged in user clicks edit section" do
      new_content = "The new module section content"
      visit "/modules/#{udl_module_with_sections.slug}"
      click_link("edit-udl-module-section-#{udl_module_with_sections.sections.first.slug}")
      fill_in "udl_module_section_content", with: new_content
      click_button "Save section"

      visit"/modules/#{udl_module_with_sections.slug}"

      expect(page).to have_content(new_content)
    end
  end
end
