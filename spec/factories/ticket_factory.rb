# frozen_string_literal: true

# This will guess the Ticket class
FactoryBot.define do
  factory :ticket do
    name { 'MyString' }
    description { 'MyText' }
    project { nil }
  end
end
