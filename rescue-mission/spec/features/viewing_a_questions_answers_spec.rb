require 'rails_helper'
require 'factory_girl'


feature 'viewing a questions answers', %Q{
  As a user
  I want to view the answers for a question
  So that I can learn from the answer
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }
  let!(:answer) { FactoryGirl.create(:answer) }
  before :each do
     sign_in user
   end

  scenario 'view question detail page' do
    visit question_path(question)
    fill_in('answer_description', with: answer.description)
    click_button('Create Answer')

    expect(page).to have_content(answer.description)
  end

  scenario 'don\'t want to see answers to other questions' do
    visit question_path(question)
    fill_in('answer_description', with: "This is the answer to the question that we're asking, and we don't want to see any other answers to other questions.")

    expect(page).to have_no_content(answer.description)
  end
  # 
  # scenario 'should see most recent answer last' do
  #   visit question_path(question)
  #   fill_in('answer_description', with: "This is the answer to the question that we're asking, and we don't want to see any other answers to other questions.")
  #   fill_in('answer_description', with: answer.description)
  #
  #   expect(page).to have_
  # end

end

def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end
