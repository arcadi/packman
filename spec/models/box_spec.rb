require 'spec_helper'

describe Box do

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_numericality_of(:volume).only_integer }

  describe '#tile' do

    it 'should contain name' do
      box = build(:box)
      box.title.should_not be_empty
      box.title.should include(box.name)
    end

  end

end
