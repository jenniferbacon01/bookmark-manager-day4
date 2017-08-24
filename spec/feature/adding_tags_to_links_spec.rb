feature 'Tags' do

  before do
    DatabaseCleaner.strategy = :truncation
  end

  after do
    DatabaseCleaner.clean
  end

  scenario 'lets you add tags to your links' do
    visit ('/links/new')
    fill_in :title, with: 'Makers Academy'
    fill_in :url, with: 'http://www.makersacademy.com'
    fill_in :tag, with: 'coding schools'
    click_button 'Submit'
    expect(page).to have_content 'coding schools'
  end
end