class Product < ApplicationRecord
  validates :name, presence: true
  validates :category, inclusion: {in: %w(fruits vegetables cereals dairy meat)}
  has_many :offerings
  has_many :producers, through: :offerings

  def season_start_month
    Date::MONTHNAMES[season_start]
  end

  def season_end_month
    Date::MONTHNAMES[season_end]
  end
end
