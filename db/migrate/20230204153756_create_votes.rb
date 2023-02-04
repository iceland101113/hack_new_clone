class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.boolean :upvote, default: false
      t.belongs_to :voteable, :polymorphic => true

      t.timestamps
    end
  end
end
