require 'rails_helper'

feature 'Discover feed' do
  before :each do
    Photo.create(image_file_name: 'test_image')
  end
  scenario 'User should see all feed of all public images' do
    visit '/discover'
    expect(page).to have_content 'test_image'
    expect(page).to have_content ''
  end
end
