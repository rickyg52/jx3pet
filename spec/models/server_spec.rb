require 'rails_helper'

describe Server, type: :model do
  subject(:server)	{ create(:server) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:region) }

  it { is_expected.to have_many(:groups) }

  it 'should be valid' do
    expect(server).to be_valid
  end

  describe 'with groups' do
    let(:server_with_groups) { create(:server, :with_groups) }

    it 'should create 3 groups' do
      expect(server_with_groups.groups.count).to eq(3)
    end
  end
end
