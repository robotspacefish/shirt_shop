class CreateShirts < ActiveRecord::Migration[6.0]
  def change
    create_table :shirts do |t|
      t.string :name
      t.text :description
      t.integer :price_in_cents
      t.belongs_to :shop, null: false, foreign_key: true
      t.timestamps
    end
  end
end
