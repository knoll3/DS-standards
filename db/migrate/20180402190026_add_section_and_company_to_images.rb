class AddSectionAndCompanyToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :section, :string
    add_column :images, :company, :string
  end
end
