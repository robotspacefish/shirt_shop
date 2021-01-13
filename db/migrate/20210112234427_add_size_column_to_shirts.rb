class AddSizeColumnToShirts < ActiveRecord::Migration[6.0]
  def change
    add_column :shirts, :size, :string
  end
end
