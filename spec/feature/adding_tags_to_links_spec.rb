require 'spec_helper'
require_relative './../../app/app.rb'

feature 'Tags' do

  before do
    DatabaseCleaner.strategy = :truncation
  end

  after do
    DatabaseCleaner.clean
  end

  it 'lets you add tags to your links' do
    visit ('/links/new')
    fill_in :title, with: 'Makers Academy'
    fill_in :url, with: 'http://www.makersacademy.com'
    fill_in :tag, with: 'coding schools'
    # click_button 'More Tags'
    # fill_in :tag, with: 'cool places'
    click_button 'Submit all'
    expect(page).to have_content 'coding schools'
  end
end

it 'lets you add multiple tags to a new link' do
  visit '/links/new'
  fill_in :url,   with: 'http://www.makersacademy.com/'
  fill_in :title, with: 'Makers Academy'
  fill_in :tags,  with: 'education ruby'
  click_button 'Create link'
  link = Link.first
  expect(link.tags.map(&:name)).to include('education', 'ruby')
end
