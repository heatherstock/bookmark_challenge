feature "add links" do
  scenario "user can add links" do
    visit '/'
    fill_in("url", with: "http://www.instagram.com")
    fill_in("title", with: "Instagram")
    click_button "Add link"
    expect(page).to have_content "Instagram"
  end
end

feature "raise error for incorrect url" do
  scenario "user inputs incorrect url" do
    visit '/'
    fill_in("url", with: "incorrect url")
    fill_in("title", with: "incorrect url")
    click_button "Add link"
    expect(page).to have_content "Please enter correct url"
  end
end
