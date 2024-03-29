# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :merchant
  belongs_to :shopper

  scope :completed, -> { where.not(completed_at: nil) }

  def calculate_fee
    case amount
    when 0...50
      amount * 1 / 100.to_f
    when 50..300
      amount * 0.95 / 100.to_f
    else
      amount * 0.85 / 100.to_f
    end
  end
end
