require 'rails_helper'
require 'helpers/user_management.rb'

feature 'Comments' do
  before do
    user = create(:user)
    photo = Photo.create(image_file_name: 'test_image', user_id: user.id)
    Comment.create(text: "This is not your comment", photo_id: photo.id, user_id: user.id)
  end

  scenario 'allows a user to leave a comment using a form' do
    sign_up
    visit photos_path
    click_link 'Leave a comment'
    fill_in 'Text', with: 'Jealous'
    click_button 'Post'

    expect(current_path).to eq photos_path
    within("ul") do
      expect(page).to have_content 'Jealous'
      expect(page).to have_content 'test_user'
    end
  end

  scenario 'allows a user to edit a comment using a form' do
    sign_up
    visit photos_path
    click_link 'Leave a comment'
    fill_in 'Text', with: 'Jealous'
    click_button 'Post'
    within("ul") do
      click_link 'Edit'
    end
    expect(current_path).to eq edit_comment_path(4)
  end

  scenario 'don\'t allow a user to edit a comment that isn\'t theirs' do
    sign_up
    visit photos_path
    within("ul") do
      expect(page).not_to have_content "Edit"
    end
  end
end
