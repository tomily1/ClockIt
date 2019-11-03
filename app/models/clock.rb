class Clock < ApplicationRecord
  self.inheritance_column = :_type_disabled
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
