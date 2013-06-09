require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  setup do
    @coupon = coupons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coupons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coupon" do
    assert_difference('Coupon.count') do
      post :create, coupon: { begin_date: @coupon.begin_date, category_id: @coupon.category_id, company_id: @coupon.company_id, description: @coupon.description, end_date: @coupon.end_date, id: @coupon.id, latitude: @coupon.latitude, longitude: @coupon.longitude, number_of_coupons: @coupon.number_of_coupons, phone: @coupon.phone, preview_image: @coupon.preview_image, price_with_coupon: @coupon.price_with_coupon, price_without_coupon: @coupon.price_without_coupon, redeem_code: @coupon.redeem_code, redeem_schedule: @coupon.redeem_schedule, showcase_image: @coupon.showcase_image, title: @coupon.title, website: @coupon.website }
    end

    assert_redirected_to coupon_path(assigns(:coupon))
  end

  test "should show coupon" do
    get :show, id: @coupon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coupon
    assert_response :success
  end

  test "should update coupon" do
    put :update, id: @coupon, coupon: { begin_date: @coupon.begin_date, category_id: @coupon.category_id, company_id: @coupon.company_id, description: @coupon.description, end_date: @coupon.end_date, id: @coupon.id, latitude: @coupon.latitude, longitude: @coupon.longitude, number_of_coupons: @coupon.number_of_coupons, phone: @coupon.phone, preview_image: @coupon.preview_image, price_with_coupon: @coupon.price_with_coupon, price_without_coupon: @coupon.price_without_coupon, redeem_code: @coupon.redeem_code, redeem_schedule: @coupon.redeem_schedule, showcase_image: @coupon.showcase_image, title: @coupon.title, website: @coupon.website }
    assert_redirected_to coupon_path(assigns(:coupon))
  end

  test "should destroy coupon" do
    assert_difference('Coupon.count', -1) do
      delete :destroy, id: @coupon
    end

    assert_redirected_to coupons_path
  end
end
