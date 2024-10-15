class AddDefaultToFollower < ActiveRecord::Migration[7.1]
  def change
    change_column_default :followers, :status, from: nil, to: "pending"
  end
end
