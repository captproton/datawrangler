class AddIndexPeopleImportTableId < ActiveRecord::Migration
  def up
    add_index :people, :import_table_id
  end

  def down
    remove_index :people, :import_table_id
  end
end
