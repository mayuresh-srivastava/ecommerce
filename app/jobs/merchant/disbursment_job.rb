# frozen_string_literal: true

module Merchant
  class DisbursmentJob < ApplicationJob
    queue_as :default

    def perform
      complete_orders = Order.completed
      complete_orders.each do |order|
        order_amount = order.amount
        order_fee = order.calculate_fee
        disburse_amount = order_amount - order_fee
        disbursement = Disbursement.new(
          amount: disburse_amount, fee: order_fee, item_id: order.merchant_id, item_type: 'Merchant'
        )
        disbursement.save
      end
    end
  end
end
