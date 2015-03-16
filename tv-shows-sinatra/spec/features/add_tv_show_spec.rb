require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.

  scenario 'user supplies all info and submits' do
    visit '/television_shows/new'
    fill_in 'title', with: 'Star Trek: TNG'
    fill_in 'network', with: 'Syfi'
    fill_in 'starting_year', with: '1991'
    # fill_in 'ending_year', with: '2015'
    # fill_in 'genre', with: 'Drama'
    # fill_in 'synopsis', with: 'Frank Underwood is awesome. Claire Underwood is even more awesome.'
    click_button 'Add TV Show'

    expect(page).to have_content("Star Trek: TNG (Syfi)")
  end

  # scenario 'user does not supply title, network, or starting year' do
  #   visit '/television_shows/new'
  #   click_button 'Add TV Show'
  #   save_and_open_page
  #   expect(page).to have_content("Error: Please provide title, network, and starting year.")
  # end

  pending "successfully add a new show"
  pending "fail to add a show with invalid information"
end
