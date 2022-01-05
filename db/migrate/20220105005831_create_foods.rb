class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.references :kind, null: false, foreign_key: true
      t.integer :price
      t.text :memo
      t.boolean :is_deleted
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
