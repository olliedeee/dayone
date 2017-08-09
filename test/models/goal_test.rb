require 'test_helper'

class GoalTest < ActiveSupport::TestCase

  def setup
    @goal = Goal.new(name: "Fly to the moon", description: "Travel to the moon and walk on its surface")
  end
  
  
  test 'recipe should be valid' do
    assert @goal.valid?
  end
  
  test 'name should be present' do
    @goal.name = " "
    assert_not @goal.valid?
  end
  
  test 'description should be present' do
    @goal.description = " "
    assert_not @goal.valid?
  end
  
  test 'description not <5 chars' do
    @goal.description = "aaa"
    assert_not @goal.valid?

  end
  
  test 'name not <5 chars' do
    @goal.name = "aaa"
    assert_not @goal.valid?

  end
  
   test 'name not >240 chars' do
    @goal.name = "a" * 241
    assert_not @goal.valid?
  end
  
  test 'description not >500 chars' do
    @goal.description = "a" * 501
    assert_not @goal.valid?
  end
  
    
  
end




