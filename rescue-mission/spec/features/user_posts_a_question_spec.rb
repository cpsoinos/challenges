require 'rails_helper'

feature 'posts a question', %Q{
  As a user
  I want to post a question
  So that I can receive help from others
} do

  scenario 'user provides valid question' do
    question_title = "What the heck is going on? with extra characters to meet the limit"
    question_description = 'I clearly don\'t know anything about Rails, but here I am trying to make it work anyway. And typing random words like a lunatic because I need to hit a certain character limit.'
    visit questions_path

    fill_in 'Title', with: question_title
    fill_in 'Description', with: question_description

    click_button 'Ask Question'

    expect(page).to have_content('Question added.')
    expect(page).to have_content(question_title)
  end

  scenario 'user provides invalid question title' do
    question_title = "too short"
    question_description = 'I clearly don\'t know anything about Rails, but here I am trying to make it work anyway. And typing random words like a lunatic because I need to hit a certain character limit.'
  end
end

