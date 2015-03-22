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
  validates :user_id, :name, presence: true

  has_many :understandings

  def breakdown
    levels = {0 => 0, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0}

    self.understandings.each do |understanding|
      levels[understanding.level] += 1
    end

    return levels
  end
end
