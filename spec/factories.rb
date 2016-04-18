FactoryGirl.define do
  factory :user do
    email "test@test.com"
    username  "test_user"
    password '12345678'
    password_confirmation '12345678'
  end
end
