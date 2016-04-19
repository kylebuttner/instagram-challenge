FactoryGirl.define do
  factory :user do
    email "test2@test.com"
    username  "test_user2"
    password '12345678'
    password_confirmation '12345678'
  end
end
