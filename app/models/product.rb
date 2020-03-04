class Product < ApplicationRecord
  validates :name, presence: true
  validates :category, inclusion: {in: %w(fruits vegetables cereals dairy meat)}
  validates :season_start, presence: true
  validates :season_end, presence: true
  has_many :offerings
  has_many :producers, through: :offerings

  def season_start_month
    Date::MONTHNAMES[season_start]
  end

  def season_end_month
    Date::MONTHNAMES[season_end]
  end
end
