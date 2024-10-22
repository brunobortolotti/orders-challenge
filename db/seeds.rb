

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


  product_iphone = Product.create! \
    name: 'iPhone 16 Pro Max',
    category: category_electronics,
    price: 799.99

  product_cheese = Product.create! \
    name: 'Aged CHeese',
    category: category_food,
    price: 19.99

  product_dress = Product.create! \
    name: 'Pink Dress',
    category: category_clothes,
    price: 19.99

  product_shirt = Product.create! \
    name: 'Black Shirt',
    category: category_clothes,
    price: 12.99

  product_ticket = Product.create! \
    name: 'Rock n Rio Ticket',
    category: category_event_tickets,
    price: 89.99

  product_superbowl_ticket = Product.create! \
    name: 'Superbowl Ticket',
    category: category_event_tickets,
    price: 199.99

  OrdersService::CreateOrder.call \
    customer: customer_john,
    payment_status: :paid,
    line_items: [
      { product: product_dress, quantity: 2 },
      { product: product_shirt, quantity: 2 }
    ]

  OrdersService::CreateOrder.call \
    customer: customer_john,
    payment_status: :paid,
    line_items: [
      { product: product_superbowl_ticket, quantity: 10 },
      { product: product_ticket, quantity: 15 }
    ]

  OrdersService::CreateOrder.call \
    customer: customer_john,
    payment_status: :paid,
    line_items: [
      { product: product_dress, quantity: 1 },
      { product: product_ticket, quantity: 7 }
    ]

  OrdersService::CreateOrder.call \
    customer: customer_john,
    payment_status: :paid,
    line_items: [
      { product: product_iphone, quantity: 2 },
    ]

  OrdersService::CreateOrder.call \
    customer: customer_john,
    payment_status: :paid,
    line_items: [
      { product: product_ticket, quantity: 4 }
    ]

  OrdersService::CreateOrder.call \
    customer: customer_john,
    payment_status: :paid,
    line_items: [
      { product: product_cheese, quantity: 7 },
      { product: product_iphone, quantity: 1 }
    ]

  OrdersService::CreateOrder.call \
    customer: customer_john,
    payment_status: :payment_declined,
    line_items: [
      { product: product_superbowl_ticket, quantity: 2 },
      { product: product_shirt, quantity: 12 }
    ]

  OrdersService::CreateOrder.call \
    customer: customer_clay,
    payment_status: :paid,
    line_items: [
      { product: product_dress, quantity: 1 },
      { product: product_shirt, quantity: 5 }
    ]

  OrdersService::CreateOrder.call \
    customer: customer_clay,
    payment_status: :paid,
    line_items: [
      { product: product_superbowl_ticket, quantity: 2 },
      { product: product_ticket, quantity: 7 }
    ]

  OrdersService::CreateOrder.call \
    customer: customer_clay,
    payment_status: :paid,
    line_items: [
      { product: product_dress, quantity: 5 },
      { product: product_ticket, quantity: 9 }
    ]

  OrdersService::CreateOrder.call \
    customer: customer_clay,
    payment_status: :paid,
    line_items: [
      { product: product_iphone, quantity: 8 },
    ]

  OrdersService::CreateOrder.call \
    customer: customer_clay,
    payment_status: :paid,
    line_items: [
      { product: product_ticket, quantity: 1 }
    ]

  OrdersService::CreateOrder.call \
    customer: customer_clay,
    payment_status: :paid,
    line_items: [
      { product: product_cheese, quantity: 8 },
      { product: product_iphone, quantity: 4 }
    ]

  OrdersService::CreateOrder.call \
    customer: customer_clay,
    payment_status: :payment_declined,
    line_items: [
      { product: product_superbowl_ticket, quantity: 1 },
      { product: product_shirt, quantity: 1 }
    ]

rescue ActiveRecord::RecordInvalid => e
  puts e.record.errors.full_messages

  raise ActiveRecord::Rollback
end
