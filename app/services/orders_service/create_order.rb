# frozen_string_literal: true

module OrdersService
  class CreateOrder < ApplicationService

    def initialize(customer:, line_items:, payment_status: nil)
      super
      @customer = customer
      @line_items = line_items || []
      @payment_status = payment_status
    end

    def execute
      map_order_items &&
        calculate_totals &&
        create_order
    end

    private

    def map_order_items
      @order_items = @line_items.map { new_order_item(_1) }
    end

    def calculate_totals
      @order_total_amount = @order_items.sum(&:total_amount)
    end

    def create_order
      Order.create! \
        customer: @customer,
        order_items: @order_items,
        total_amount: @order_total_amount,
        payment_status: @payment_status
    end

    def new_order_item(line_item)
      OrderItem.new \
        product: line_item[:product],
        quantity: line_item[:quantity],
        unit_price: line_item[:product].price,
        total_amount: line_item[:product].price * line_item[:quantity]
    end
  end
end