feature 'Tags' do

  before do
    DatabaseCleaner.strategy = :truncation
  end

  after do
    DatabaseCleaner.clean
  end

  scenario 'lets you filter by tag' do
    visit ('/links/new')
    fill_in :title, with: 'Bubble shop'
    fill_in :url, with: 'http://www.bubbles.com'
    fill_in :tag, with: 'bubbles'
    click_button 'Submit'
    visit ('/tags/bubbles')
    expect(page).to have_content 'bubbles'
  end
end
