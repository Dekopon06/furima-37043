FactoryBot.define do
  factory :order do
    token {"tok_abcdefghijk00000000000000000"}

    code {'123-4567'}
    prefecture_id { 2 }
    town { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    telephone {'09012345678'}
  end
end