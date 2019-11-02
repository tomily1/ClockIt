class Clock < ApplicationRecord
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
