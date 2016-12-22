require 'rails_helper'

describe Servers::Group, type: :model do
	subject(:group) 		{ create(:group) }

	it { is_expected.to validate_presence_of(:server) }
	it { is_expected.to validate_presence_of(:group_num) }

	it 'should be valid' do
		expect(group).to be_valid
	end
end