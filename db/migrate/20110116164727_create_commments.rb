class CreateCommments < ActiveRecord::Migration
  def self.up
    create_table :commments do |t|
      t.integer :article_id
      t.integer :user_id
      t.string :body

      t.timestamps
    end
  end

  def self.down
    drop_table :commments
  end
end
