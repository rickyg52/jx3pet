require 'rails_helper'

describe Pet, type: :model do
  subject(:pet)	{ create(:pet) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:min_cd) }
  it { is_expected.to validate_presence_of(:max_cd) }

  it { is_expected.to have_many(:pet_aliases) }

  it 'should be valid' do
    expect(pet).to be_valid
  end

  describe 'with aliases' do
    let(:pet_with_aliases) { create(:pet, :with_aliases) }

    it 'should create 3 aliases' do
      expect(pet_with_aliases.pet_aliases.count).to eq(3)
    end
  end
end
