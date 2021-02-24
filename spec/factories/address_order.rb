FactoryBot.define do
  factory :address_order do
    postal_code                { '123-4578' }
    prefecture_id              { 2 }
    municipality               { '台東区雷門' }
    address                    { '青山1-1-1' }
    building_name              { '柳ビル' }
    phone_number               { '12312341233' }
    token                      { 'abcdefg' }
  end
end