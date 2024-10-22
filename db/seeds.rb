

ActiveRecord::Base.transaction do
  customer_john = Customer.create! \
    name: 'John',
    email: 'john@example.com'

  customer_clay = Customer.create! \
    name: 'Clay',
    email: 'clay@example.com'

  category_clothes = Category.create! \
    name: 'Clothes'

  category_food = Category.create! \
    name: 'Food'

  category_electronics = Category.create! \
    name: 'Electronics'

  category_clothes = Category.create! \
    name: 'Clothes'

  category_event_tickets = Category.create! \
    name: 'Event Tickets'

  product_dress = Product.create! \
    name: 'Pink Dress',
    category: category_clothes,
    product_type: :physical,
    default_price: 19.99,
    sale_price: 15.99

  product_ticket = Product.create! \
    name: 'Rock n Rio Ticket',
    category: category_event_tickets,
    product_type: :digital,
    default_price: 89.99

  order_1 = Order.create! \
    customer: customer_john,
    order_items: [
      OrderItem.new(product: product_dress, quantity: 2, product_unit_price: product_dress.current_price),
      OrderItem.new(product: product_ticket, quantity: 2, product_unit_price: product_ticket.current_price)
    ]

rescue ActiveRecord::RecordInvalid => e
  puts e.record.errors.full_messages

  raise ActiveRecord::Rollback
end
