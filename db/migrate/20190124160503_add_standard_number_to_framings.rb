class AddStandardNumberToFramings < ActiveRecord::Migration[5.1]
  def change
    add_column :framings, :standard_number, :string
  end
end
