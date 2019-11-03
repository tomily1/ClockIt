# frozen_string_literal: true

FactoryBot.define do
  factory :clock do
    details    { 'foo bar' }
    clocked_at { Time.now }
    type       { 'Clock::In' }
    association :user, factory: :user
  end

  trait(:in) do
    type       { 'Clock::In' }
  end

  trait(:out) do
    type       { 'Clock::Out' }
  end
end
