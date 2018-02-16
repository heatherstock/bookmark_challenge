feature 'viewing links' do
  scenario 'User can see links' do
    Link.add(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/'
    click_button 'Show links'
    expect(page).to have_content 'Makers Academy'
  end
end
