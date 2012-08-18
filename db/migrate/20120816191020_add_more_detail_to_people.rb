class AddMoreDetailToPeople < ActiveRecord::Migration
  def change
    add_column :people, :job_title, :string
    add_column :people, :company_name, :string
    add_column :people, :phone_number, :string
    add_column :people, :email_address, :string
    add_column :people, :lead_status, :string
    add_column :people, :lead_score, :string
    add_column :people, :response_type, :string
    add_column :people, :lead_source, :string
    add_column :people, :country, :string
    add_column :people, :industry, :string
  end
end
