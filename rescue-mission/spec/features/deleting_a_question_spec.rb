require 'rails_helper'

feature 'deleting a question', %Q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }
  let!(:answer) { FactoryGirl.create(:answer) }
  before :each do
     sign_in user
   end

  scenario 'user views question details page' do
    visit question_path(question)

    expect(page).to have_button("Delete Question")
  end

  scenario 'user deletes a question from details page' do
    visit question_path(question)
    click_button("Delete Question")

    expect(page).to have_content("Question deleted.")
  end

  scenario 'user views question edit page' do
    visit edit_question_path(question)

    expect(page).to have_button("Delete Question")
  end

  scenario 'user deletes a question from edit page' do
    visit edit_question_path(question)
    click_button("Delete Question")

    expect(page).to have_content("Question deleted.")
  end
end

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end
