require 'rails_helper'
require 'helpers/user_management.rb'

feature 'Comments' do
  before do
    user = create(:user)
    Photo.create(image_file_name: 'test_image', user_id: user.id)
  end

  scenario 'allows a user to leave a comment using a form' do
    sign_up
    visit photos_path
    click_link 'Leave a comment'
    fill_in 'Text', with: 'Jealous'
    click_button 'Post'

    expect(current_path).to eq photos_path
    expect(page).to have_content 'Jealous'
    within("li") do
      expect(page).to have_content 'test_user'
    end
  end
end
