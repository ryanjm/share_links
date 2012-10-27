class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.text :body
      t.references :web_link

      t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :web_link_id
  end
end
