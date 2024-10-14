class CreateFollowers < ActiveRecord::Migration[7.1]
  def change
    create_table :followers do |t|
      t.integer :sender_id
      t.integer :recepient_id
      t.string :status

      t.timestamps
    end
  end
end
