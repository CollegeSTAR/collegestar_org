require 'spec_helper'

RSpec.feature "ThreeTwoOneVideo Management" do
  
  let(:video) { create(:three_two_one_video) }
  let(:released_video) { create(:released_three_two_one_video) }
  let(:video_attrs) { attributes_for(:three_two_one_video) }
  let(:admin) {  create(:admin_user) }

  feature "Index of Videos" do
    before(:each) do
      released_video
      video

    end

    scenario "User visits videos index" do
      visit "/three-two-one-videos"

      expect(page).to have_content(released_video.title)
      expect(page).to have_content(released_video.description)
    end

    context "While logged in" do
      before(:each) do
        # login
        visit "/login"
        fill_in "Email", with: admin.email
        fill_in "Password", with: admin.password

        click_button "Log In"
      end

      scenario "User visits videos index" do
        visit "/three-two-one-videos"

        expect(page).to have_content("Unreleased videos")
        expect(page).to have_content(video.title)
      end
    end
  end

  feature "Display a single video page" do
    scenario "User visits a video" do
      visit "/three-two-one-videos/#{released_video.slug}"

      expect(page).to have_content(released_video.notes)
    end
  end

  feature "Create a new video" do
    context "While logged in as an admin" do
      before(:each) do
        visit "/login"
        fill_in "Email", with: admin.email
        fill_in "Password", with: admin.password
        click_button "Log In"
      end
      scenario "User visits new three two one video page" do
        visit "/three-two-one-videos"

        click_link 'Create a new video'

        fill_in 'three_two_one_video[title]', with: video_attrs[:title]
        fill_in 'three_two_one_video[youtube_id]', with: video_attrs[:youtube_id]
        fill_in 'three_two_one_video[caption]', with: video_attrs[:caption]
        fill_in 'three_two_one_video[description]', with: video_attrs[:description]
        fill_in 'three_two_one_video[notes]', with: video_attrs[:notes]

        click_button "submit_video_button"

        expect(page).to have_text("Successfully created Three Two One Video")
        expect(page).to have_text video_attrs[:title]
        expect(page).to have_text video_attrs[:caption]
        expect(page).to have_text video_attrs[:notes]
      end
    end
    context "While not logged in" do
      scenario "User tries to click create new video link" do
        visit "/three-two-one-videos"

        expect(page).to_not have_text("Create a new video")
      end
      scenario "User visits new three two one video page" do
        visit "/three-two-one-videos/new"

        expect(page).to have_text("not authorized")
      end
    end
  end

  feature "Edit existing video" do
    context "While logged in as an admin" do
      before(:each) do
        visit "/login"
        fill_in "Email", with: admin.email
        fill_in "Password", with: admin.password
        click_button "Log In"
      end
      scenario "User visits edit page of existing video" do
        visit "/three-two-one-videos/#{released_video.slug}/edit"
        fill_in 'three_two_one_video[notes]', with: 'The new notes text that was edited'

        click_button "submit_video_edit_button"

        expect(page).to have_text('The new notes text that was edited')
        expect(page).to have_text('Successfully updated Three Two One Video')
      end
    end
    context "While not logged in" do
      scenario "User visits edit page of existing video" do
        visit "/three-two-one-videos/#{released_video.slug}/edit"

        expect(page).to have_text("not authorized")
      end
    end
  end
end
