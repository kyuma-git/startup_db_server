class ChangeColumnToCompany < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :funding_stage_id, :integer
    add_reference :companies, :funding_stage, foreign_key: true
  end
end
