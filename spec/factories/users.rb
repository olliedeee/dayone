FactoryGirl.define do
  factory :user2 do
    email 'test@example.com'
    password 'password'
    username 'Anyoldusername'

  end
  
    factory :user do
    email 'test@example.com'
    password 'password'
    confirmed_at          Time.now
    username 'Anyoldusername'
  end
end