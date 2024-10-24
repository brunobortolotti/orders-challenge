require 'rails_helper'

RSpec.describe Order, type: :model do
  # let(:customer) { create(:customer) }

  describe "Validations" do
    subject { build(:order) }

    it { is_expected.to validate_presence_of(:total_amount) }
    # it { is_expected.to define_enum_for(:order_status).with(['pending', 'completed']) }
    # it { is_expected.to validate_inclusion_of(:order_status).in_array() }
    # it { is_expected.to validate_inclusion_of(:payment_status).in_array(['awaiting_payment', 'payment_declined', 'paid']) }
    # it { is_expected.to validate_inclusion_of(:fulfillment_status).in_array(['awaiting_fulfillment', 'shipped', 'delivered']) }

    it { is_expected.to belong_to(:customer) }
    it { is_expected.to have_many(:order_items) }
  end
end
