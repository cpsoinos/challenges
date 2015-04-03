require "rails_helper"

feature "salesman adds a car", %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
  } do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:manufacturer) { FactoryGirl.create(:manufacturer) }
  let!(:car) { FactoryGirl.create(:car) }
  before :each do
    sign_in user
  end

  scenario "visits list of cars" do
    visit cars_path

    expect(page).to have_link("Add a new car")
  end

  scenario "visit new car page" do
    visit cars_path
    click_link "Add a new car"

    expect(page).to have_content("Manufacturer")
    expect(page).to have_content("Model")
    expect(page).to have_content("Year")
    expect(page).to have_content("Color")
    expect(page).to have_content("Mileage")
    expect(page).to have_button("Create Car")
  end

  scenario "provide valid information" do
    visit new_car_path
    select(manufacturer.name, from: "car_manufacturer_id")
    fill_in("Model", with: "Veloster")
    select("2012", from: "Year")
    fill_in("Color", with: "Red")
    fill_in("Mileage", with: "35000")
    click_button("Create Car")

    expect(page).to have_content("Car added!")
    expect(page).to have_content("2012")
    expect(page).to have_content(manufacturer.name)
    expect(page).to have_content("Veloster")
    expect(page).to have_content("Red")
    expect(page).to have_content("35000")
  end

  scenario "does not provide model" do
    visit new_car_path
    select(manufacturer.name, from: "car_manufacturer_id")
    select("2012", from: "Year")
    fill_in("Color", with: "Red")
    fill_in("Mileage", with: "35000")
    click_button("Create Car")

    expect(page).to have_content("Model can't be blank")
  end

  scenario "does not provide color" do
    visit new_car_path
    select(manufacturer.name, from: "car_manufacturer_id")
    fill_in("Model", with: "Veloster")
    select("2012", from: "Year")
    fill_in("Mileage", with: "35000")
    click_button("Create Car")

    expect(page).to have_content("Color can't be blank")
  end

  scenario "does not provide mileage" do
    visit new_car_path
    select(manufacturer.name, from: "car_manufacturer_id")
    fill_in("Model", with: "Veloster")
    select("2012", from: "Year")
    fill_in("Color", with: "Red")
    click_button("Create Car")

    expect(page).to have_content("Mileage can't be blank")
  end

  scenario "can't enter a year before 1920" do
    visit new_car_path
    expect(page).to_not have_select("Year", selected: "1919")
  end

end
