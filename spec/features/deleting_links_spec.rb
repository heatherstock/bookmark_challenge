feature 'Deleting links' do
  scenario 'User can delete links' do
    id = Link.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    within "#link-#{id}" do
      click_button 'Delete link'
    end
    expect(current_path).to eq '/links'
    expect(page).not_to have_content 'Makers Academy'
  end
end
