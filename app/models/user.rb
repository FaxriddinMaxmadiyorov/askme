class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname
  after_create :send_message

  validates :email, presence: true, uniqueness: true

  def downcase_nickname
    nickname.downcase!
  end

  def send_message
    SendMessageTelegram.run(user: self)
  end
end
