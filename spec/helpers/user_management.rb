def sign_up
  visit '/users/sign_up'
  fill_in 'Username', with: 'test_user'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: '12345678'
  fill_in 'Password confirmation', with: '12345678'
  click_button 'Sign up'
end
