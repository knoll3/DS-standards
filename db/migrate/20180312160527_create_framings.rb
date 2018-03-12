class CreateFramings < ActiveRecord::Migration[5.1]
  def change
    create_table :framings do |t|
      t.text :desc
      t.string :coserv
      t.string :oncor
      t.string :tnmp
      t.string :trinity_valley

      t.timestamps
    end
  end
end
