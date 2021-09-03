require "application_system_test_case"

class NearStationsTest < ApplicationSystemTestCase
  setup do
    @near_station = near_stations(:one)
  end

  test "visiting the index" do
    visit near_stations_url
    assert_selector "h1", text: "Near Stations"
  end

  test "creating a Near station" do
    visit near_stations_url
    click_on "New Near Station"

    fill_in "Line", with: @near_station.line
    fill_in "Station name", with: @near_station.station_name
    fill_in "Time on foot", with: @near_station.time_on_foot
    click_on "Create Near station"

    assert_text "Near station was successfully created"
    click_on "Back"
  end

  test "updating a Near station" do
    visit near_stations_url
    click_on "Edit", match: :first

    fill_in "Line", with: @near_station.line
    fill_in "Station name", with: @near_station.station_name
    fill_in "Time on foot", with: @near_station.time_on_foot
    click_on "Update Near station"

    assert_text "Near station was successfully updated"
    click_on "Back"
  end

  test "destroying a Near station" do
    visit near_stations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Near station was successfully destroyed"
  end
end
