# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  comments_count         :integer          default(0)
#  email                  :citext           default(""), not null
#  encrypted_password     :string           default(""), not null
#  likes_count            :integer          default(0)
#  private                :boolean
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :citext
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :photos, class_name: "Photo", foreign_key: "owner_id"
  
  has_many :follower, through: "Follower", source: "status"

  has_many :comments, foreign_key: "author_id"

  def follower
    followers = Follower.where(:id => :sender_id).where(:status => "accepted")
    if followers == 0
      return "0"
    else
      return followers
    end
  end

  def pending 
    pending_follows = Follower.where(:id => :sender_id).where(:status => "pending")
    if pending_follows == 0
      return "0"
    else
      return pending_follows
    end
  end

  def following
    following = Follower.where(:id => :receiver_id).where(:status => "accepted")
    if following == 0
      return "0"
    else
      return following
    end
  end
end
