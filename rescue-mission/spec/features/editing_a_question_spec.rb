require 'rails_helper'

feature 'editing a question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }
  let!(:answer) { FactoryGirl.create(:answer) }
  before :each do
     sign_in user
   end

  scenario 'User clicks on edit question' do
    visit question_path(question)
    click_button('Edit Question')

    expect(page).to have_content("Description")
    expect(page).to have_field('question_description')
    expect(page).to have_button('Update Question')
  end

  scenario 'User provides invalid entry' do
    visit edit_question_path(question)
    fill_in('question_description', with: 'too short') # not working
    click_button("Update Question")

    expect(page).to have_content("Invalid entry")
  end


end

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end
