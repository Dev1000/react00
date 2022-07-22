FactoryBot.define do
  factory :post do
    user
    title { 'A great title' }
    body { 'A great body' }
  end
end
