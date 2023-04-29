FactoryBot.define do
  factory :operation do
    name { 'Travel' }
    amount { '300.50' }
    category { '✈️' }
    user
  end
end
