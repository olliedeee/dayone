require 'test_helper'

class UsersListingTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create!(username: "tester", email: "tester@example.com",
                    password: "password", password_confirmation: "password")
    @user2 = User.create!(username: "tester1", email: "tester1@example.com",
                    password: "password", password_confirmation: "password")
  end
  
  test "should get users listing" do
    get users_path
    assert_template 'users/index'
  assert_select "a[href=?]", user_path(@user), text: @user.username.capitalize
  assert_select "a[href=?]", user_path(@user2), text: @user2.username.capitalize
  end








end
