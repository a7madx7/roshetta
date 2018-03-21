require 'test_helper'

class RxesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rx = rxes(:one)
  end

  test "should get index" do
    get rxes_url
    assert_response :success
  end

  test "should get new" do
    get new_rx_url
    assert_response :success
  end

  test "should create rx" do
    assert_difference('Rx.count') do
      post rxes_url, params: { rx: { allowed_dispense_count: @rx.allowed_dispense_count, dispensed_count: @rx.dispensed_count, dispenser_id: @rx.dispenser_id, expired: @rx.expired, expires_at: @rx.expires_at, full_diagnosis: @rx.full_diagnosis, issuer_id: @rx.issuer_id, patient_id: @rx.patient_id, picture: @rx.picture, professional_comment: @rx.professional_comment, short_diagnosis: @rx.short_diagnosis, starts_at: @rx.starts_at, status: @rx.status, total_value: @rx.total_value, visibility: @rx.visibility } }
    end

    assert_redirected_to rx_url(Rx.last)
  end

  test "should show rx" do
    get rx_url(@rx)
    assert_response :success
  end

  test "should get edit" do
    get edit_rx_url(@rx)
    assert_response :success
  end

  test "should update rx" do
    patch rx_url(@rx), params: { rx: { allowed_dispense_count: @rx.allowed_dispense_count, dispensed_count: @rx.dispensed_count, dispenser_id: @rx.dispenser_id, expired: @rx.expired, expires_at: @rx.expires_at, full_diagnosis: @rx.full_diagnosis, issuer_id: @rx.issuer_id, patient_id: @rx.patient_id, picture: @rx.picture, professional_comment: @rx.professional_comment, short_diagnosis: @rx.short_diagnosis, starts_at: @rx.starts_at, status: @rx.status, total_value: @rx.total_value, visibility: @rx.visibility } }
    assert_redirected_to rx_url(@rx)
  end

  test "should destroy rx" do
    assert_difference('Rx.count', -1) do
      delete rx_url(@rx)
    end

    assert_redirected_to rxes_url
  end
end
