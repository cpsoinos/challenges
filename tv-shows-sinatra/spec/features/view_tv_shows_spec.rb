require "spec_helper"
require "launchy"

feature "user views list of TV shows" do
  let(:game_of_thrones) { TelevisionShow.create!({
        title: "Game of Thrones", network: "HBO",
        starting_year: 2011, genre: "Fantasy"
      }) }
  let(:married_with_children) { TelevisionShow.create!({
        title: "Married... with Children", network: "Fox",
        starting_year: 1987, ending_year: 1997,
        genre: "Comedy"
      }) }

  # As a TV fanatic
  # I want to view a list of TV shows
  # So I can find new shows to watch
  #
  # Acceptance Criteria:
  # * I can see the names and networks of all TV shows

  scenario "view list of TV shows" do
    # The user visits the index page
    visit "/television_shows"

    # And should see both TV shows listed (just the title and network)
    expect(page).to have_content("Game of Thrones (HBO)")
    expect(page).to have_content("Married... with Children (Fox)")
  end

  # As a TV fanatic
  # I want to view the details for a TV show
  # So I can find learn more about it

  # Acceptance Criteria:
  # * I can see the title, network, start and end year, genre, and synopsis
  #   for a show.
  # * If the end year is not provided it should indicate that the show is still
  #   running.

  scenario "view details for a TV show" do
    visit "television_shows/#{game_of_thrones.id}"

    expect(page).to have_content("#{game_of_thrones.title}")
    expect(page).to have_content("#{game_of_thrones.network}")
    expect(page).to have_content("#{game_of_thrones.starting_year}")
    expect(page).to have_content("Still running!")
    expect(page).to have_content("#{game_of_thrones.genre}")
    expect(page).to have_content("#{game_of_thrones.synopsis}")
  end

  scenario "view details for a TV show with missing information" do
    visit "television_shows/#{game_of_thrones.id}"

    expect(page).to have_content("Error! Information missing.")
  end
end
