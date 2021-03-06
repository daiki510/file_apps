# frozen_string_literal: true

FactoryBot.define do
  sequence :name do |n|
    "user_#{n}"
  end

  factory :user do
    name
    age { [*1..100].sample }
    gender { User.gender.values.sample }
  end
end
