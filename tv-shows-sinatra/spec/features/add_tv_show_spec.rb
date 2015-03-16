require "spec_helper"
require "launchy"

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

  scenario 'synopsis is longer than 5000 characters' do
    visit '/television_shows/new'
    fill_in 'title', with: 'House of Cards'
    fill_in 'network', with: 'HBO'
    fill_in 'starting_year', with: '2013'
    fill_in 'synopsis', with: "#{'z' * 5001}"
    click_button 'Add TV Show'

    expect(page).to have_content("Error: Synopsis cannot be more than 5000 characters.")
  end

  scenario "start or end year is after 1900" do
    visit '/television_shows/new'
    fill_in 'title', with: 'House of Cards'
    fill_in 'network', with: 'HBO'
    fill_in 'starting_year', with: '1888'
    fill_in 'ending_year', with: '1889'
    click_button 'Add TV Show'

    expect(page).to have_content("Error: Show must have started and ended after 1900.")
  end

  scenario "successfully add a new show" do
    visit '/television_shows/new'
    fill_in 'title', with: 'Star Trek: TNG'
    fill_in 'network', with: 'Syfi'
    fill_in 'starting_year', with: '1991'
    click_button 'Add TV Show'

    expect(page).to have_content("Star Trek: TNG (Syfi)")
  end

  scenario "fail to add a show with invalid information" do
    visit '/television_shows/new'
    click_button 'Add TV Show'

    expect(page).to have_content("Error: Please provide title, network, and starting year.")
  end
end
