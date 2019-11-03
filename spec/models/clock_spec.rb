# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Clock do
  it 'should be initialized' do
    expect(described_class.new).to be_truthy
  end
  context 'validations and relationship' do
    it { should belong_to(:user) }
    it { should validate_presence_of(:type) }
  end
end
