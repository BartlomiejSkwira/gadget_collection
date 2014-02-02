require_relative '../spec_helper'

describe Gadget do
  before do
    @user = create(:user)
    @gadget = create(:gadget, user: @user)
  end

  context 'valid gadget' do

    subject { @gadget }

    it { should respond_to(:name) }
    it { should be_valid }
  end

  context 'invalid gadget' do
    it do
      gadget = build(:gadget, name: nil, user: @user)
      gadget.should_not be_valid
    end

    it do
      gadget = build(:gadget, name: 'Name')
      gadget.should_not be_valid
    end

  end

end
