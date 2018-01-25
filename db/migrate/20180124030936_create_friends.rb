class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.references :user, foreign_key: true
      t.integer :friend_id
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
