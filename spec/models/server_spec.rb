require 'rails_helper'

describe Server, type: :model do
	subject(:server) 		{ create(:server) }

	it { is_expected.to validate_presence_of(:name) }
	it { is_expected.to validate_presence_of(:region) }

	it { is_expected.to have_many(:groups) }

	it 'should be valid' do
		expect(server).to be_valid
	end
end