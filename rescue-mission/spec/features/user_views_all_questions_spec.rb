require 'rails_helper'
require 'factory_girl'

feature 'user views all questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }

  scenario 'user sees list of questions' do
    visit questions_path
    expect(page).to have_content(question.title)
    expect(page).to_not have_content(question.description)
  end

  scenario 'user sees questions sorted by last created questions' do
    visit questions_path
    expect(page).to have_content(question.created_at)
  end

end
