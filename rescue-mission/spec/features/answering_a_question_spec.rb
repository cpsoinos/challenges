require 'rails_helper'
require 'factory_girl'

feature 'answer question', %Q{
  As a user
  I want to answer another user's question
  So that I can help them solve their problem
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }
  let!(:answer) { FactoryGirl.create(:answer) }
  before :each do
     sign_in user
   end

  scenario 'user views question page' do
    visit question_path(question)

    expect(page).to have_content('Answer this question')
    expect(page).to have_button('Create Answer')
  end

  scenario 'user posts answer from the question detail page' do
    visit question_path(question)
    fill_in('answer_description', with: answer.description)
    click_button('Create Answer')

    expect(page).to have_content(answer.description)
  end

  scenario 'user\'s answer is too short' do
    visit question_path(question)
    fill_in('answer_description', with: 'too short of an answer')
    click_button('Create Answer')

    expect(page).to have_content('Answer must be more than 50 characters!')
  end
end

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end
