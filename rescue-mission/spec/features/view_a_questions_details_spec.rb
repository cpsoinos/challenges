require 'rails_helper'
require 'factory_girl'

feature 'view a questions details', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
}do

let!(:question) { FactoryGirl.create(:question) }

  scenario 'visitor can get to question details from question index' do

    visit questions_path
    click_link(question.title)

    expect(page).to have_content(question.description)
  end

  scenario 'visitor views question details' do
    visit question_path(question)
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end
end
