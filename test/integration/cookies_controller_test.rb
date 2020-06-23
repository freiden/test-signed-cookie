require 'test_helper'

class CookiesControllerTest < ActionController::TestCase
  setup do
    cookies.signed[CookiesController::COOKIE_KEY] = 'Bilbon le hobbit'
  end

  def cleanup
    cookies.clear
  end

  test "should not find a cookie in the controller" do
    assert_raises('SignedCookieError') { get :index }
    assert_not_equal [CookiesController::COOKIE_KEY.to_s], cookies.to_h.keys
  end

  test "should find the cookie" do
    assert_equal 'Bilbon le hobbit', cookies.signed[CookiesController::COOKIE_KEY]
  end
end
