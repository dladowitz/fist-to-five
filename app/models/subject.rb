# == Schema Information
#
# Table name: subjects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Subject < ActiveRecord::Base
  validates :user_id, presence: true

  has_many :understandings
end
