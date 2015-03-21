# == Schema Information
#
# Table name: understandings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  subject_id :integer
#  level      :integer
#  created_at :datetime
#  updated_at :datetime
#

class Understanding < ActiveRecord::Base
  validates :subject_id, :level, presence: true
  validates :level, :inclusion => 1..5

  belongs_to :user
  belongs_to :subject
end
