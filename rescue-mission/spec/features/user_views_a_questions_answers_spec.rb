require 'rails_helper'

feature 'views a question\'s answers', %Q{
  As a user
  I want to view the answers for a question
  So that I can learn from the answer
} do

  scenario 'user clicks on a question' do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)

    visit 'questions'
    click_link(question.title)

    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end

  scenario 'user views question details' do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question)

    visit '/questions/:id'
    expect(page).to have_content(question.title)
    expect(page).to have_content(question.description)
  end

end
