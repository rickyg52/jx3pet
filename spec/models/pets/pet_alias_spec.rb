require 'rails_helper'

describe Pets::PetAlias, type: :model do
	subject(:pet_alias) 		{ create(:pet_alias) }

	it { is_expected.to validate_presence_of(:pet) }
	it { is_expected.to validate_presence_of(:server) }

	it { is_expected.to have_many(:pet_serendipities) }

	it 'should be valid' do
		expect(pet_alias).to be_valid
	end
end