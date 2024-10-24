require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "associations" do
    it { should belong_to(:customer) }
    it { should have_many(:order_items) }
  end

  describe "validations" do
    it "shodn't validates presence on total_amount" do
      expect(subject).to validate_presence_of(:total_amount)
    end
  end

  describe 'enums' do
    let(:customer) { create(:customer) }

    describe '.order_status' do
      it 'initializes as pending' do
        expect(subject.order_status).to eq('pending')
      end

      it 'allows completed' do
        subject.order_status_completed!
        expect(subject.order_status).to eq('completed')
      end
      it 'does not allow nil/other status' do
        subject.order_status = nil
        subject.save
        expect(subject.order_status).to eq('pending')

        subject.order_status = 'other'
        expect(subject.order_status).to eq('pending')
      end
    end
  end
end