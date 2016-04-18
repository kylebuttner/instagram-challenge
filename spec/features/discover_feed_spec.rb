require 'rails_helper'
require 'helpers/user_management.rb'

feature 'Discover feed' do
  before :all do
    user = create(:user)
    Photo.create(image_file_name: 'test_image', user_id: user.id)
  end
  scenario 'User should see all feed of all public images' do
    visit '/discover'
    expect(page).to have_content 'test_image'
    expect(page).to have_content 'test_user'
  end
end
