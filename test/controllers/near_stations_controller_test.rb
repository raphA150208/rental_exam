require 'test_helper'

class NearStationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @near_station = near_stations(:one)
  end

  test "should get index" do
    get near_stations_url
    assert_response :success
  end

  test "should get new" do
    get new_near_station_url
    assert_response :success
  end

  test "should create near_station" do
    assert_difference('NearStation.count') do
      post near_stations_url, params: { near_station: { line: @near_station.line, station_name: @near_station.station_name, time_on_foot: @near_station.time_on_foot } }
    end

    assert_redirected_to near_station_url(NearStation.last)
  end

  test "should show near_station" do
    get near_station_url(@near_station)
    assert_response :success
  end

  test "should get edit" do
    get edit_near_station_url(@near_station)
    assert_response :success
  end

  test "should update near_station" do
    patch near_station_url(@near_station), params: { near_station: { line: @near_station.line, station_name: @near_station.station_name, time_on_foot: @near_station.time_on_foot } }
    assert_redirected_to near_station_url(@near_station)
  end

  test "should destroy near_station" do
    assert_difference('NearStation.count', -1) do
      delete near_station_url(@near_station)
    end

    assert_redirected_to near_stations_url
  end
end
