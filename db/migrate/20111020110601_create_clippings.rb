class CreateClippings < ActiveRecord::Migration
  def change
    create_table :clippings do |t|
      t.string :title
      t.text :content
      t.string :url
      t.references :notebook

      t.timestamps
    end
    add_index :clippings, :notebook_id
  end
end
