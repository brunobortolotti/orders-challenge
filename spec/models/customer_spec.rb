require 'rails_helper'

RSpec.describe Customer, type: :model do
  # let(:customer) { create(:customer) }

  describe "Validations" do
    subject { build(:customer) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end
end
