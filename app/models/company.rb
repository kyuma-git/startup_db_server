require 'csv'
class Company < ApplicationRecord
  belongs_to :country
  # belongs_to :funding_stage

  validates :name, uniqueness: true

  scope :search, -> (search_params) do
    return if search_params.blank?
    name_like(search_params[:name])
    .country(search_params[:country_id])
    .funding_stage(search_params[:funding_stage])
    .industry_like(search_params[:industry])
  end

  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present?}
  scope :country, -> (country_id) {where(country_id: country_id) if country_id.present?}
  scope :funding_stage, -> (funding_stage) {where('funding_stage LIKE?', "%#{funding_stage}%") if funding_stage.present?}
  scope :industry_like, -> (industry) { where('industry LIKE ?', "%#{industry}%") if industry.present?}

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: 'UTF-8') do |row|
      company = find_by(id: row["id"]) || new
      # if company.valid?
        p "great"
        company.attributes = row.to_hash.slice(*updatable_attributes)
        if company.save
          p "saved"
        else
          next
        end
      # else
        # p "same"/
        # # company.attributes = row.to_hash.slice(*updatable_attributes)
        # company.update!
      # end
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
      "created_at",
      "updated_at",
      "funding_stage",
      "members",
      "share_holder",
      "origin",
      "institute",
      "industry",
      "adress",
      "company_number",
      "phone_number",
      "company_url",
    ]
  end
end