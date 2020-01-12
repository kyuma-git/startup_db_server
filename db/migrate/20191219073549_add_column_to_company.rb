class AddColumnToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :funding_stage, :string
  end
end
