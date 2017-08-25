FactoryGirl.define do
   factory :user do
    email 'test@example.com'
    password 'password'
    confirmed_at          Time.now
    username 'ConfirmedUsername'
    role 'user'
  end
  

  
  trait :admin do
    role 'admin'
    username 'AdminUsername'
  end
  
   trait :user2 do
    username 'UnconfirmedUser'
    confirmed_at          nil
  end
  
end