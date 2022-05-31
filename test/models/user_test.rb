require "test_helper"

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:julia)
  end

  test "associated tasks should be destroyed" do
    @user.save
    @user.tasks.create!(content: "task")
    assert_difference 'Task.count', -1 do
      @user.destroy
    end
  end
end
