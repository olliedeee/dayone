require 'test_helper'

class RecipesEditTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  
  
  def setup
      @user = User.create!(username: "tester", email: "name@email.com")
      @goal = Goal.create(name: "climb everest", description: "auto description", user: @user)
    end
    
    test "reject invalid recipe update" do
      
      
    end
    
    
    test "successfully edit recipe update" do
    
    end

end
