class Log < ActiveRecord::Base
  with_options greater_than_or_equal_to: 0, allow_nil: true do
    validates_numericality_of :mem_free, less_than_or_equal_to: :mem_total, only_integer: true, if: :mem_total
    validates_numericality_of :swap_free, less_than_or_equal_to: :swap_total, only_integer: true, if: :swap_total
    validates_numericality_of :cpu_load, less_than_or_equal_to: 100
  end
end
