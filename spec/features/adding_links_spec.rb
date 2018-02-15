feature "adding links" do
  scenario "User can add links" do
    visit '/'
    fill_in("url", with: "http://www.instagram.com")
    click_button "Add link"
    expect(page).to have_content "http://www.instagram.com"
  end
end

feature "raise error for incorrect url" do
  scenario "user inputs incorrect url" do
    visit '/'
    fill_in("url", with: "incorrect url")
    click_button "Add link"
    expect(page).to have_content "Please enter correct url"
  end
end
