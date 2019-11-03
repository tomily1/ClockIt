# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { "nipi#{rand}@test.co" }
    name  { 'nipi tiri' }
  end
end
