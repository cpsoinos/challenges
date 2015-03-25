require 'rails_helper'
require 'factory_girl'

feature 'answer question', %Q{
  As a user
  I want to answer another user's question
  So that I can help them solve their problem
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }
  before :each do
     sign_in user
   end

   def create_answer(description)
    visit question_path(question)
    fill_in('Description', with: description)
    click_button('Create Answer')
   end

  scenario "visitor posts answer from the question detail page" do
    visit question_path(question)

    expect(page).to have_button('Create Answer')
    expect(page).to contain('Description')
  end

  scenario "visitor must provide a description that >50 characters" do


  end

  scenario "visitor receives errors for invalid input" do
    answer_description = "Really way too short"
    create_answer(answer_description)
    expect(page).to have_content("Invalid entry")
  end
end


def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end
