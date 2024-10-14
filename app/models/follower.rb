# == Schema Information
#
# Table name: followers
#
#  id           :bigint           not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recepient_id :integer
#  sender_id    :integer
#
class Follower < ApplicationRecord

  belongs_to :recepient, class_name: 'User' , foreign_key: 'recepient_id'

  validates :sender_id, uniqueness: { scope: :recepient_id }

  after_create :send_notification

end
