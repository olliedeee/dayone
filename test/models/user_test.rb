require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(username: "Alongusername", email: "username@example.com")
  end
  
  
  test 'User should be valid' do
    assert @user.valid?
  end
  
  test 'Username should be present' do
    @user.username = " "
    assert_not @user.valid?
  end
  
  
  test 'Username not <5 chars' do
    @user.username = "a"
    assert_not @user.valid?

  end
  
   test 'Username not >240 chars' do
    @user.username = "a" * 311
    assert_not @user.valid?
  end
  
  
  
  test 'email should be present' do
    @user.email = " "
    assert_not @user.valid?
  end
  
  test 'email should be <130 chars' do
    @user.email = "a" * 129 + "@example.com"
    assert_not @user.valid?
  end
  
  
  
  test 'email should accept formats' do
    valid_emails = %w[user@example.com ollie@gmail.com m.first@aol.ca james+jones@co.uk.org]
      valid_emails.each do |valids|
        @user.email = valids
        assert @user.valid?, "#{valids.inspect} should be valid"
      end
  end 
  
  test 'reject invalid emails' do
    invalid_emails = %w[user@example ollie@example,com ollie.surname@gmail. james@gmai+il.com]
    invalid_emails.each do |invalids|
      @user.email = invalids
      assert_not @user.valid?, "#{invalids.inspect} should be invalid"
    end
  end
  
  test 'email should be unique & insensitive' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  
  test "lowercase emails only in db" do
    mixed_email = "John@ExamLe.Com"
    @user.email = mixed_email
    @user.save
    assert_equal mixed_email.downcase, @user.reload.email
  end
  
  
  
end






