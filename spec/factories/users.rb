# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  deleted_at      :datetime
#  hashed_password :string           not null
#  name            :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  login_id        :string           not null
#
FactoryBot.define do
  factory :user do
    sequence(:login_id) { |n| "user#{n}" }
    password { 'password' }
    sequence(:name) { |n| "ユーザー#{n}" }
  end
end
