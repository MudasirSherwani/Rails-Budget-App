require 'rails_helper'

RSpec.describe Operation, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let!(:category2) { FactoryBot.create(:category, icon: '✈️', name: 'Travel', user:) }
  subject { described_class.new(name: 'Dubai', author: user, user:, category: category2) }

  it 'Should be valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'Should not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should not valid without an icon' do
    subject.author = nil
    expect(subject).to_not be_valid
  end

  it 'Should belongs to a user' do
    expect(subject.author).to eq(user)
  end

  it 'has many categories' do
    expect(subject.categories).to eq([])
  end
end
