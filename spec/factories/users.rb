FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'a00000'}
    password_confirmation {password}
    first_name            {'太郎'}
    family_name           {'てすと'}
    first_furigana        {'タロウ'}
    family_furigana       {'テスト'}
    birthday              {'1930-01-01'}
  end
end