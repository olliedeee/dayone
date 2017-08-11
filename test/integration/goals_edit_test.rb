require 'test_helper'

class GoalsEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create!(username: "username", email: "username@example.com",
                        password: "password", password_confirmation: "password")
    @goal = Goal.create(name: "A goal", description: "Visit the moon", user: @user)
  end
 
  test "reject invalid goal update" do
    sign_in_as(@user, "password")
    get edit_goal_path(@goal)
    assert_template 'goals/edit'
    patch goal_path(@goal), params: { goal: { name: " ", 
                                description: "some description" } } 
    assert_template 'goals/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "successfully edit a goal" do
    sign_in_as(@user, "password")
    get edit_goal_path(@goal)
    assert_template 'goals/edit'
    updated_name = "updated goal name"
    updated_description = "updated goal description"
    patch goal_path(@goal), params: { goal: { name: updated_name, 
                                description: updated_description } }
    assert_redirected_to @goal
    #follow_redirect!
    assert_not flash.empty?
    @goal.reload
    assert_match updated_name, @goal.name
    assert_match updated_description, @goal.description
  end
  
  test "reject invalid goal submissions" do
    sign_in_as(@user, "password")
    get new_goal_path
    assert_template 'goals/new'
    assert_no_difference 'Goal.count' do
      post goals_path, params: { goal: { name: " ", 
                                          description: " " } }
    end
    assert_template 'goals/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "reject an invalid edit" do
    sign_in_as(@user, "password")
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { username: " ", 
                                    email: " username @example.com" } }
    assert_template 'users/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "accept valid signup" do
    sign_in_as(@user, "password")
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { username: "username", 
                                  email: " username @example.com" } }
    assert_redirected_to @user
    assert_not flash.empty?
    @user.reload
    assert_match " username ", @user.username
    assert_match " username @example.com", @user.email
  end
end
