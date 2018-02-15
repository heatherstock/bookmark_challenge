feature 'update links' do
  scenario 'user can update a link' do
    DatabaseConnection.query("INSERT INTO links VALUES(4, 'http://www.instagram.com', 'Instagram')");

    visit '/links'

    within '#link-4' do
      click_button "Edit link"
    end

    expect(current_path).to eq '/edit_link/4'

    expect(page).to have_selector("input[value='Instagram']")

    fill_in("title", with: "Instagramo")
    click_button "Update link"

    expect(page).to have_content "Instagramo"
  end
end