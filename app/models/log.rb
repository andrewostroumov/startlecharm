class Log < ActiveRecord::Base
  belongs_to :server

  with_options greater_than_or_equal_to: 0, allow_nil: true do
    validates_numericality_of :memory_free, less_than_or_equal_to: :memory_total, only_integer: true, if: :memory_total
    validates_numericality_of :memory_available, less_than_or_equal_to: :memory_total, only_integer: true, if: :memory_total
    validates_numericality_of :swap_free, less_than_or_equal_to: :swap_total, only_integer: true, if: :swap_total
  end

  validates :server_id, presence: true
end
