# frozen_string_literal: true

class Clock < ApplicationRecord
  self.inheritance_column = :_type_disabled

  validates :type,
            inclusion: {
              in: ['Clock::In', 'Clock::Out'],
              message: '%{value} is not a valid/supported clock type'
            }
  belongs_to :user, foreign_key: :user_id

  class In < Clock
    def type
      'in'
    end
  end

  class Out < Clock
    def type
      'out'
    end
  end
end
