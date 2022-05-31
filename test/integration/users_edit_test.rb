require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:yusuke)
  end

  test "successful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    name = "takeshi"
    email = "takeshi@example.com"
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password: "",
                                              password_confirmation: "" } }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    patch user_path(@user), params: { user: { name: "",
                                              email: "yusuke@com",
                                              password: "abc",
                                              password_confirmation: "123" } }
    assert_select 'div.errors_title', '4個のエラーがあります'
  end
end
