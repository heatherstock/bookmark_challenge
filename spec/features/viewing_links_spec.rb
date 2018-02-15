feature "viewing links" do
  scenario "User can see links" do
    visit '/'
    click_button "Show links"
    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Google"
    expect(page).to have_content "Facebook"
  end
end
