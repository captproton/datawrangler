class AddIndexPeopleDisqualified < ActiveRecord::Migration
  def up
    add_index :people, :disqualified
  end

  def down
    remove_index :people, :disqualified
  end
  
end