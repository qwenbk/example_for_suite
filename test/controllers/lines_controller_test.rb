require 'test_helper'

class LinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line = lines(:one)
  end

  test "should get index" do
    get lines_url
    assert_response :success
  end

  test "should get new" do
    get new_line_url
    assert_response :success
  end

  test "should create line" do
    assert_difference('Line.count') do
      post lines_url, params: { line: { form_of_training: @line.form_of_training, level: @line.level, mark: @line.mark, ovz: @line.ovz, period: @line.period, registry_number: @line.registry_number, section_id: @line.section_id, specialty: @line.specialty, verification: @line.verification } }
    end

    assert_redirected_to line_url(Line.last)
  end

  test "should show line" do
    get line_url(@line)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_url(@line)
    assert_response :success
  end

  test "should update line" do
    patch line_url(@line), params: { line: { form_of_training: @line.form_of_training, level: @line.level, mark: @line.mark, ovz: @line.ovz, period: @line.period, registry_number: @line.registry_number, section_id: @line.section_id, specialty: @line.specialty, verification: @line.verification } }
    assert_redirected_to line_url(@line)
  end

  test "should destroy line" do
    assert_difference('Line.count', -1) do
      delete line_url(@line)
    end

    assert_redirected_to lines_url
  end
end
