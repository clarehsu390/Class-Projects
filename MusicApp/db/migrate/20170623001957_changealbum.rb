class Changealbum < ActiveRecord::Migration[5.0]
  def change
    rename_table :albums, :bands
  end
end
