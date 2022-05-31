require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "",
                                         email: "invalid@com",
                                         password: "abcd",
                                         password_confirmation: "abcdef" } }
    end
    assert_select 'div.errors_title', '3個のエラーがあります'
  end

  test "valid signup information" do
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name: "yusuke",
                                         email: "yusuke@example.com",
                                         password: "1234",
                                         password_confirmation: "1234" } }
    end
    assert_not flash.empty?
    assert is_logged_in?
  end
end
