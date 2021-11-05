FactoryBot.define do
  factory :item do
    item_name              {'testテストてすと1234１２３４'}
    explain                {'testテストてすと1234１２３４'}
    category_id            {'2'}
    detail_id              {'2'}
    charge_id              {'2'}
    prefecture_id          {'2'}
    shipp_id               {'2'}
    price                  {'300'}
    # image                  {Faker::Lorem.sentence}

    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
