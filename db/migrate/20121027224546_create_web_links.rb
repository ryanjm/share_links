class CreateWebLinks < ActiveRecord::Migration
  def change
    create_table :web_links do |t|
      t.string :url
      t.boolean :archived, :default => false
      t.references :user

      t.timestamps
    end
  end
end
