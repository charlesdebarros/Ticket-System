# frozen_string_literal: true

# This will guess the Ticket class
FactoryBot.define do
  factory :ticket do
    name { 'Ticket #1 name' }
    description { 'This is, somehow, a reasonably half decent ticket description' }
    project { nil }
    author_id { User.last.id }
  end
end
