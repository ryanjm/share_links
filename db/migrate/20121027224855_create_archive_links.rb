class CreateArchiveLinks < ActiveRecord::Migration
  def change
    create_table :archive_links do |t|
      t.references :user
      t.references :web_link

      t.timestamps
    end
    add_index :archive_links, :user_id
    add_index :archive_links, :web_link_id
  end
end
