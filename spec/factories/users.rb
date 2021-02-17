# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }

    trait :admin do
      admin { true }
    end
  end

  factory :user_nil do
    sequence(:email) { nil }
    password { nil }
    trait :admin do
      admin { false }
    end
  end
end
