FactoryBot.define do
  factory :item do
    name { 'カバカバン' }
    description                       { '軽い' }
    detail_id                         { 2 }
    regarding_delivery_id             { 2 }
    selling_price_id                  { 2 }
    category_id                       { 2 }
    prefecture_id                     { 2 }
    value                             { 300 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample.png'), filename: 'sample.png', content_type: 'image/png')
    end
  end
end
