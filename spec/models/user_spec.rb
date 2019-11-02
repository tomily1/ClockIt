require 'rails_helper'

RSpec.describe User do

  context 'new user' do
    it 'should be initialized' do
      expect(described_class.new).to be_truthy
    end

    it 'should be validated' do
      expect(described_class.new.valid?).to eq false
    end

    it 'should not have duplicate email' do
    end

    it 'should be created if valid' do
      expect do
        described_class.create(name: "Test User", email: 'test@test.co')
      end.to change { User.count }.by(1)
    end

    it 'should not be created with invalid email' do
      user = User.new(name: "Test User", email: 'test')
      expect(user.save).to eq false
    end

    it 'should not created with invalid name' do
      user = User.new(name: "", email: 'test1@abc.co')
      expect(user.save).to eq false
    end
  end
end
