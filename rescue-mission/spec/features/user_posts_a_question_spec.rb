require 'rails_helper'

feature 'posts a question', %Q{
  As a user
  I want to post a question
  So that I can receive help from others
} do

  scenario 'user clicks link from index to ask a new question' do
    visit questions_path
    click_link('Post a new question')
    expect(page).to have_button('Create Question')
  end

  scenario 'user provides valid question' do
    question_title = "What the heck is going on? with extra characters to meet the limit"
    question_description = 'I clearly don\'t know anything about Rails, but here I am trying to make it work anyway. And typing random words like a lunatic because I need to hit a certain character limit.'
    visit new_question_path
    session[:user_id] = 123

    fill_in 'Title', with: question_title
    fill_in 'Description', with: question_description

    click_button 'Create Question'

    expect(page).to have_content('Question added.')
    expect(page).to have_content(question_title)
  end

  scenario 'user provides invalid information' do
    question_title = 'too short'
    question_description = 'Way too short'

    visit new_question_path
    fill_in('Title', with: question_title)
    fill_in('Description', with: question_description)
    click_button('Create Question')

    expect(page).to have_content("Invalid entry.")
  end
end
