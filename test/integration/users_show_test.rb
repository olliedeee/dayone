require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest

def setup
  @user = User.create!(username: "alongusername", email: "email@test.com", password:"password", password_confirmation:"password")
  @goal = @user.goals.build(name: "Climb everest", description: "climb mount everest by the time I am 30", user: @user)  
  @goal2 = Goal.create(name: "Climb everest", description: "climb mount everest by the time I am 30", user: @user)
  @goal.save
end

  test "should get users show" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select "a[href=?]", goal_path(@goal), text: @goal.name
    assert_select "a[href=?]", goal_path(@goal2), text: @goal2.name
    assert_match @goal.description, response.body
    assert_match @goal2.description, response.body
    assert_match @user.username, response.body
  end
  
end
