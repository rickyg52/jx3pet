require 'rails_helper'

describe Pets::PetAlias, type: :model do
  subject(:pet_alias)	{ create(:pet_alias) }

  it { is_expected.to validate_presence_of(:pet) }
  it { is_expected.to validate_presence_of(:server) }

  it { is_expected.to have_many(:pet_serendipities) }

  it 'should be valid' do
    expect(pet_alias).to be_valid
  end

  describe 'with serendipities' do
    let(:pet_alias_a) { create(:pet_alias, :with_serendipities) }

    it 'should create 5 serendipities' do
      expect(pet_alias_a.pet_serendipities.count).to eq(5)
    end
  end
end
