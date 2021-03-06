# == Schema Information
#
# Table name: activities
#
#  id             :integer          not null, primary key
#  action         :integer          not null
#  trackable_id   :integer          not null
#  trackable_type :string           not null
#  user_id        :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_activities_on_action_and_trackable_id_and_trackable_type  (action,trackable_id,trackable_type)
#  index_activities_on_user_id                                     (user_id)
#

class Activity < ActiveRecord::Base

  module ACTION
    CREATE = 0
    UPDATE = 1
    DESTROY = 2
  end

  VALID_ACTIONS = ACTION::CREATE..ACTION::DESTROY
  RECENT_LIMIT = 20

  scope :by_newest, -> { order :created_at => :desc }


  belongs_to :trackable, :polymorphic => true
  belongs_to :user


  def self.most_recent
    self.by_newest.limit(RECENT_LIMIT)
  end

end
