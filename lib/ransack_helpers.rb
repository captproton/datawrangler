module RansackHelpers
  def self.to_csv(ransack_result, options = {})
    CSV.generate(options) do |csv|
      result_array = ransack_result.result
      column_names = result_array.first.class.column_names
      csv << column_names
      result_array.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
end
