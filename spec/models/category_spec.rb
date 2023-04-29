require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { FactoryBot.create(:user) }
  subject { described_class.new(name: 'Travel', icon: '✈️', user:) }

  it 'Should be valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'Should not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should not valid without an icon' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'Should be belongs to a user' do
    expect(subject.user).to eq(user)
  end

  it 'Should has many operations' do
    expect(subject.operations).to eq([])
  end
end
