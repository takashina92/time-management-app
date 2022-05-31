require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:yusuke)
  end

  test "login with invalid information" do
    post login_path, params: { session: { email: "", password: "" } }
    assert_not flash.empty?
  end

  test "login with valid information folloed by logout" do
    post login_path, params: { session: { email: @user.email, password: '1234' } }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
  end

  test "login with remembering" do 
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token']
  end

  test "login without remembering" do
    log_in_as(@user)
    delete logout_path
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['remember_token']
  end

end
