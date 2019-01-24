class AddStandardNumberToFramings < ActiveRecord::Migration[5.1]
  def change
    add_column :framings, :standard_framing, :string
  end
end
