class ChangeHrefToPageInImages < ActiveRecord::Migration[5.1]
  def change
    rename_column :images, :href, :page
  end
end
