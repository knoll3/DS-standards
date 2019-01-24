class AddOwnerToFramings < ActiveRecord::Migration[5.1]
  def change
    add_column :framings, :owner, :string
  end
end
