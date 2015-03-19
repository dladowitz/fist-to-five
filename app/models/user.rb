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

  validate :admin_change, on: :update

  has_many :understandings
  has_many :subjects

  has_secure_password


  ### Instance Methods

  def admin_change
    if self.admin_changed?
      errors.add(:admin, "state can only be changed by current admin") unless User.current_user.admin?
    end
  end

  ### Class Methods

  # Not sure how Thread works here, but a guy on the interweb seems to thing its ok:
  # http://clearcove.ca/2008/08/recipe-make-request-environment-available-to-models-in-rails/
  def self.current_user
    Thread.current[:user]
  end

  def self.current_user=(user)
    Thread.current[:user] = user
  end
end
