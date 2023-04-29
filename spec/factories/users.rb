FactoryBot.define do
  factory :user do
    name { 'Mudasir' }
    sequence :email do |n|
      "mudasir#{n}@gmail.com"
    end
    password { '123456' }
  end
end
