require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  # let(:customer) { create(:customer) }

  describe "Validations" do
    subject { build(:order_item) }

    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:unit_price) }
    it { is_expected.to validate_presence_of(:total_amount) }
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:product) }
  end
end
