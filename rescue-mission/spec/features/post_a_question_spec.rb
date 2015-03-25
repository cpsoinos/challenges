require 'rails_helper'

feature 'post a question', %Q{
  As a user
  I want to post a question
  So that I can receive help from others

} do

  let(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }
  before :each do
    sign_in user
  end

  scenario 'visitor clicks link to post new question' do
    visit questions_path
    click_link('Post a Question')
    expect(page).to have_button('Create Question')
  end

  scenario 'visitor provides valid question' do
    visit new_question_path
    fill_in('Title', with: question.title)
    fill_in('Description', with: question.description)
    click_button('Create Question')

    expect(page).to have_content('Question added')
    expect(page).to have_content(question.title)
  end

  scenario 'vistor provides invalid information' do
    question_title = "Too short"
    question_description = "Really way too short."

    visit new_question_path
    fill_in('Title', with: question_title)
    fill_in('Description', with: question_description)
    click_button('Create Question')

    expect(page).to have_content("Invalid entry")
  end

end

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end
