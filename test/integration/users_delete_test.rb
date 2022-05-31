require "test_helper"

class UsersDeleteTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:yusuke)
  end

  test "delete user with wrong password" do
    log_in_as(@user)
    assert_no_difference 'User.count' do
      delete user_path(@user), params: { user: { password: " " } }
    end
    assert_not flash.empty?
  end

  test "delete user with correct password" do
    log_in_as(@user)
    assert_difference 'User.count', -1 do
      delete user_path(@user), params: { user: { password: "1234" } }
    end
    assert_redirected_to root_url
    assert_not flash.empty?
  end
end