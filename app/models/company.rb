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
    .has_vc(search_params[:share_holder])
  end

  scope :name_like, -> (name) { where('name LIKE ?', "%#{name}%") if name.present?}
  scope :country, -> (country_id) {where(country_id: country_id) if country_id.present?}
  scope :funding_stage, -> (funding_stage) {where('funding_stage LIKE?', "%#{funding_stage}%") if funding_stage.present?}
  scope :industry_like, -> (industry) { where('industry LIKE ?', "%#{industry}%") if industry.present?}
  scope :has_vc, -> (share_holder) { where('share_holder LIKE ?', "vc") }
  scope :latest, -> { where(country_id: 1).order(created_at: :desc).limit(10) }
  scope :hot, -> { order(total_fund_amount: :desc).limit(10) }

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: 'UTF-8') do |row|
      company = find_by(id: row["id"]) || new
      company.attributes = row.to_hash.slice(*updatable_attributes)
      if company.save
      else
        next
      end
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
      "members",
      "share_holder",
      "origin",
      "institute",
      "industry",
      "adress",
      "company_number",
      "phone_number",
      "company_url",
      "last_funded_date"
    ]
  end
end