# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  admin           :boolean
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email,      presence: true, uniqueness: true
  validates :password,   presence: { on: create }, length: { minimum: 6 }, if: :password_digest_changed?

  has_many :understandings
  has_many :subjects

  has_secure_password
end
