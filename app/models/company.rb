require 'csv'
class Company < ApplicationRecord
  belongs_to :country
  belongs_to :funding_stage
  scope :search, -> (search_params) do
    return if search_params.blank?
    name_like(search_params[:name])
    .country(search_params[:country_id])
    .funding_stage(search_params[:funding_stage_id])
    .industry_like(search_params[:industry])
  end

  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present?}
  scope :country, -> (country_id) {where(country_id: country_id) if country_id.present?}
  scope :funding_stage, -> (funding_stage_id) {where(funding_stage_id: funding_stage_id) if funding_stage_id.present?}
  scope :industry_like, -> (industry) { where('industry LIKE ?', "%#{industry}%") if industry.present?}

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: 'UTF-8') do |row|
      company = find_by(id: row["id"]) || new
      company.attributes = row.to_hash.slice(*updatable_attributes)
      company.save!
    end
  end

  def self.updatable_attributes
    [
      "id",
      "name",
      "description",
      "tag",
      "founder",
      "country_id",
      "total_fund_amount",
      "region",
      "established_date",
      # "last_funded_date",
      "created_at",
      "updated_at",
      "funding_stage_id",
      "members",
      "share_holder",
      "origin",
      "institute",
      "industry",
      "adress",
      "company_number",
      "phone_number",
      "company_url",
      # "country"
    ]
    # ["id", "name", "description", "founded"]
  end
end