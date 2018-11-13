require 'test_helper'

class SoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sourse = sourses(:one)
  end

  test "should get index" do
    get sourses_url
    assert_response :success
  end

  test "should get new" do
    get new_sourse_url
    assert_response :success
  end

  test "should create sourse" do
    assert_difference('Sourse.count') do
      post sourses_url, params: { sourse: { date_of: @sourse.date_of, kind: @sourse.kind, number: @sourse.number, reason_id: @sourse.reason_id, value: @sourse.value } }
    end

    assert_redirected_to sourse_url(Sourse.last)
  end

  test "should show sourse" do
    get sourse_url(@sourse)
    assert_response :success
  end

  test "should get edit" do
    get edit_sourse_url(@sourse)
    assert_response :success
  end

  test "should update sourse" do
    patch sourse_url(@sourse), params: { sourse: { date_of: @sourse.date_of, kind: @sourse.kind, number: @sourse.number, reason_id: @sourse.reason_id, value: @sourse.value } }
    assert_redirected_to sourse_url(@sourse)
  end

  test "should destroy sourse" do
    assert_difference('Sourse.count', -1) do
      delete sourse_url(@sourse)
    end

    assert_redirected_to sourses_url
  end
end
