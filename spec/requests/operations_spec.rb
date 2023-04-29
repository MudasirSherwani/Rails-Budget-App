require 'rails_helper'

RSpec.describe 'Operations', type: :request do
  let(:user) { FactoryBot.create(:user) }
  let!(:category) { FactoryBot.create(:category, icon: '✈️', name: 'Travel', user:) }
  let!(:operation1) { FactoryBot.create(:operation, name: 'Dubai', author: user, category:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'Should returns a success response' do
      get category_operations_path(category)
      expect(response).to be_successful
    end
  end
end
