require 'test_helper'

class HabCodesControllerTest < ActionController::TestCase
  setup do
    @hab_code = hab_codes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hab_codes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hab_code" do
    assert_difference('HabCode.count') do
      post :create, hab_code: { assigned: @hab_code.assigned, coach_id: @hab_code.coach_id, code: @hab_code.code, completed: @hab_code.completed, date_sent: @hab_code.date_sent, debriefed: @hab_code.debriefed, email: @hab_code.email, first_name: @hab_code.first_name, last_name: @hab_code.last_name, registered: @hab_code.registered, report_sent: @hab_code.report_sent }
    end

    assert_redirected_to hab_code_path(assigns(:hab_code))
  end

  test "should show hab_code" do
    get :show, id: @hab_code
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hab_code
    assert_response :success
  end

  test "should update hab_code" do
    patch :update, id: @hab_code, hab_code: { assigned: @hab_code.assigned, coach_id: @hab_code.coach_id, code: @hab_code.code, completed: @hab_code.completed, date_sent: @hab_code.date_sent, debriefed: @hab_code.debriefed, email: @hab_code.email, first_name: @hab_code.first_name, last_name: @hab_code.last_name, registered: @hab_code.registered, report_sent: @hab_code.report_sent }
    assert_redirected_to hab_code_path(assigns(:hab_code))
  end

  test "should destroy hab_code" do
    assert_difference('HabCode.count', -1) do
      delete :destroy, id: @hab_code
    end

    assert_redirected_to hab_codes_path
  end
end
