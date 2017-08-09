require 'test_helper'

class GoalsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  
  
  def setup
    @user = User.create!(username: "tester", email: "name@email.com")
    @goal = Goal.create(name: "climb everest", description: "auto description")
    @goal2 = @user.goals.build(name: "Run a marathon", description: "run a marathon & finish in top 60%")
    @goal2.save
  end
  
  test "should get goals index" do
    get goals_url 
    assert_response :success
  end
  
  test "should get goals listing" do
    get goals_path
    assert_template 'goals/index'
    assert_match @goal.name, response.body
    assert_match @goal2.name, response.body
  end
  
  
  
end
