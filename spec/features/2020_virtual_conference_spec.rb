RSpec.feature "Virutal Conference" do

  scenario "User visits conference page" do
    visit "/virtual-conference"

    expect(page).to have_content("College STAR Virtual Conference")
  end
end
