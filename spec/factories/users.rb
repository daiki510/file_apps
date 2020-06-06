FactoryBot.define do
  sequence :name do |n|
    "user_#{n}"
  end

  factory :user do
    name
    age { [*1..100].sample }
    gender { ["male", "femail"].sample }
  end
end
