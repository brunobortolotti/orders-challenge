require 'rails_helper'

RSpec.describe OrdersService::CreateOrder do
  let(:customer) { create(:customer) }
  let(:line_items) { [{ product: create(:product), quantity: 3 }] }
  let(:payment_status) { 'awaiting_payment' }

  subject { OrdersService::CreateOrder.call(customer:, line_items:, payment_status:) }

  context '' do
    it 'creates the order' do
      expect { subject }.to(change { Order.count }.by(1))
    end
  end
end
