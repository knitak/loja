FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:address) { |n| "Rua person_#{n}"}
    postalcode "0000-000"
    password "foobar"
    password_confirmation "foobar"
    email "Example@user.com"

    factory :admin do
      admin true
    end
  end


end