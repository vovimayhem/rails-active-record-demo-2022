# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    sequence(:full_name) { |n| "Example Employee #{n}" }
  end
end
