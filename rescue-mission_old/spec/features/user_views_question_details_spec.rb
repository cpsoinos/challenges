require 'rails_helper'

feature 'user views question details', %Q{
  As a user
  I want to view a question's details
  So that I can effectively understand the question
} do

  let!(:question) { FactoryGirl.create(:question) }

  scenario 'visitor clicks link from index' do
    visit questions_path
    click_link('This is question numero 1! I don\'t know the answer.')
    expect(page).to have_content(question.description)
  end

  scenario 'visitor views question details' do
    visit question_path(question)
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end

end
