require 'rails_helper'

feature 'user deletes a question', %Q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions
} do
  # scenario 'specify valid credentials' do
  #   user = FactoryGirl.create(:user)

  #   visit new_user_session_path

  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: user.password

  #   click_button 'Log in'

  #   expect(page).to have_content('Signed in successfully')
  #   expect(page).to have_content('Sign Out')
  # end

  # scenario 'specify invalid credentials' do
  #   visit new_user_session_path

  #   click_button 'Log in'
  #   expect(page).to have_content('Invalid email or password')
  #   expect(page).to_not have_content('Sign Out')
  # end
end
