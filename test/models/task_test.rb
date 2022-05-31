require "test_helper"

class TaskTest < ActiveSupport::TestCase

  def setup
    @user = users(:yusuke)
    @task = @user.tasks.build(content: "タスク")
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "user id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end
  
  test "content should be present" do
    @task.content = " "
    assert_not @task.valid?
  end

  test "content should be at most 100 characters" do
    @task.content = "a" * 101
    assert_not @task.valid?
  end

  test "order should be most recent firtst" do
    assert_equal tasks(:most_recent), Task.first
  end
end
