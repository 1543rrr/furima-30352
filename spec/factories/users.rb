FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 {Faker::Internet.free_email}
    password              { 'a000000' }
    password_confirmation { password }
    first_name            { '小原' }
    last_name             { '舞輝' }
    first_name_kana       { 'オハラ' }
    last_name_kana        { 'マイキ' }
    birth_day             { '1993-10-21' }
  end
end

