# == Schema Information
#
# Table name: users
#
#  id                           :bigint           not null, primary key
#  account_name(アカウント名)   :string(255)      not null
#  deleted_at(削除日時)         :datetime
#  email(メールアドレス)        :string(255)      not null
#  password_digest(パスワード)  :string(255)      not null
#  provider(プロバイダ)         :string(255)
#  remember_token(トークン記憶) :string(255)
#  reset_sent_at                :datetime
#  reset_token                  :string(255)
#  uid(SNSユーザーID)           :string(255)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
# Indexes
#
#  index_users_on_email             (email) UNIQUE
#  index_users_on_uid_and_provider  (uid,provider) UNIQUE
#
class User < ApplicationRecord
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_one :detail, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  class << self
    def new_token
      SecureRandom.urlsafe_base64
    end

    def digest(string)
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create(string, cost: cost)
    end
  end
end
