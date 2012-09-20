class AddDisqualifiedToPerson < ActiveRecord::Migration
  def change
    add_column :people, :disqualified, :boolean, :default => 0
  end
end
