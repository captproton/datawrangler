class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  belongs_to :import_table  

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
  
end
