# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    sequence(:name) { |n| "Example Employee #{n}" }
  end
end
