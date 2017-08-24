


feature 'Adding links' do
  before do
    DatabaseCleaner.strategy = :truncation
    # Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    # DatabaseCleaner.start
  end

  after do
    DatabaseCleaner.clean
  end

  scenario 'Add links to the links page' do
    visit '/links'
    click_button 'Add links'
    fill_in :title, with: 'Makers Academy'
    fill_in :url, with: 'http://www.makersacademy.com'
    click_button 'Submit'
    within 'ul#links' do
    expect(page).to have_content('Makers Academy')
    end
  end
end
