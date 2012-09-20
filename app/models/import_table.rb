class ImportTable < ActiveRecord::Base
  attr_accessible :original_path
  has_many :import_cells, :dependent => :destroy

  has_many :people, :dependent => :destroy
end
