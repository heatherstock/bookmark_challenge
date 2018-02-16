feature 'Updating links' do
  scenario 'User can update links' do
    id = Link.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    within "#link-#{id}" do
      click_button 'Update link'
    end
    expect(current_path).to eq '/update'
    fill_in('url', with: 'http://www.shmackersacademy.com')
    fill_in('title', with: 'Shmakers Academy')
    click_button "Update"
    expect(page).to have_content 'Shmakers Academy'
    expect(page).not_to have_content 'Makers Academy'
  end
end
