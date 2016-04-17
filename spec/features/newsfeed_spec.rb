require 'rails_helper'

feature 'Newsfeed' do
  context 'User not logged in' do
    # scenario 'should be redirected to discover page' do
    #   visit '/'
    #   expect(current_path).to eq '/'
    # end
  end

  context 'User logged in' do
    before :each do
      visit '/users/sign_up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 12345678
      fill_in 'Password confirmation', with: 12345678
      click_button 'Sign up'
    end

    scenario 'can upload a caption' do
      find(:css, 'a#upload').click
      fill_in 'Caption', with: 'Beautiful photo'
      click_button 'Upload'
      expect(page).to have_content 'Beautiful photo'
    end

    scenario 'can upload a photo' do
      find(:css, 'a#upload').click
      attach_file 'photo[image]', 'spec/asset_specs/smiley.jpg'
      fill_in 'Caption', with: 'Beautiful photo'
      click_button 'Upload'
      expect(page).to have_content 'Beautiful photo'
    end

    context 'does not follow anyone' do
      scenario 'sees message to follow others' do
        expect(page).to have_content "Go follow someone!"
      end
    end
  end
end
