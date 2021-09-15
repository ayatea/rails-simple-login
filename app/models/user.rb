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
class User < ApplicationRecord
  acts_as_paranoid

  # パスワードの設定時に暗号化を行う
  # @param [String] password 平文パスワード
  def password=(password)
    self.hashed_password = BCrypt::Password.create(password)
  end
end
