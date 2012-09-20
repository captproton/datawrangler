class AddImportTableIdToPerson < ActiveRecord::Migration
  def change
    add_column :people, :import_table_id, :integer
  end
end
