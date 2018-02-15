feature "delete links" do
  scenario "user can delete links" do
    visit '/links'

    within '#link-1' do
      click_button "Delete link"
    end

    expect(current_path).to eq '/links'
    expect(page).not_to have_content "Makers Academy"
  end
end
