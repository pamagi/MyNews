require 'test_helper'

class CommmentsControllerTest < ActionController::TestCase
  setup do
    @commment = commments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:commments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create commment" do
    assert_difference('Commment.count') do
      post :create, :commment => @commment.attributes
    end

    assert_redirected_to commment_path(assigns(:commment))
  end

  test "should show commment" do
    get :show, :id => @commment.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @commment.to_param
    assert_response :success
  end

  test "should update commment" do
    put :update, :id => @commment.to_param, :commment => @commment.attributes
    assert_redirected_to commment_path(assigns(:commment))
  end

  test "should destroy commment" do
    assert_difference('Commment.count', -1) do
      delete :destroy, :id => @commment.to_param
    end

    assert_redirected_to commments_path
  end
end
