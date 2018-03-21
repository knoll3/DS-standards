class AddHrefToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :href, :string
  end
end
