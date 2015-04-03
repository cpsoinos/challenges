require "rails_helper"

feature "salesman adds a manufacturer", %Q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
  } do

  let!(:user) { FactoryGirl.create(:user) }
  before :each do
    sign_in user
  end

  scenario "visits home page" do
    visit root_path

    expect(page).to have_link("Add a new manufacturer")
  end

  scenario "visits new manufacturer page" do
    visit root_path

    click_link "Add a new manufacturer"
    expect(page).to have_content("Name")
    expect(page).to have_content("Country")
    expect(page).to have_button("Create Manufacturer")
  end

  scenario "provide valid information" do
    visit new_manufacturer_path
    fill_in("Name", with: "Hyundai")
    fill_in("Country", with: "South Korea")
    click_button("Create Manufacturer")

    expect(page).to have_content("Manufacturer added!")
    expect(page).to have_content("Hyundai")
  end

  scenario "does not provide manufacturer name" do
    visit new_manufacturer_path
    fill_in("Country", with: "South Korea")
    click_button("Create Manufacturer")

    expect(page).to have_content("Name can't be blank")
    expect(page).to have_button("Create Manufacturer")
  end

  scenario "does not provide country of origin" do
    visit new_manufacturer_path
    fill_in("Name", with: "Hyundai")
    click_button("Create Manufacturer")

    expect(page).to have_content("Country can't be blank")
    expect(page).to have_button("Create Manufacturer")
  end

  scenario "visit manufacturer details page" do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit root_path
    click_link(manufacturer.name)

    expect(page).to have_content(manufacturer.name)
    expect(page).to have_content(manufacturer.country)
  end


end
