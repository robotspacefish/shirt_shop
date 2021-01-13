class AddColumnColorToShirts < ActiveRecord::Migration[6.0]
  def change
     add_column :shirts, :color, :string
  end
end
