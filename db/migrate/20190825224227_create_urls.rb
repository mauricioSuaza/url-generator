class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :original
      t.string :shortened
      t.string :title
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
