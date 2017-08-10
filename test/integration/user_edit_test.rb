require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
   @user = User.create!(username: "alongusername", email: "email@test.com", password:"password", password_confirmation:"password")
  end


  test "reject invalid edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { username: " ", email: " "} }
    assert_template 'users/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
      
  test "accept valid sign up" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { username: "tester", email: "test@tester.com"} }
    assert_redirected_to @user
    assert_not flash.empty?
    @user.reload
    assert_match "tester", @user.username
    assert_match "test@tester.com", @user.email
  end
   
end
