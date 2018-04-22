class Drug < ApplicationRecord
  # TODO: add the ability to update the prices for a whole country by a factor.
  validates :name, presence: true, uniqueness: true, length:
      { minimum: 2, maximum: 256, too_short: 'Drug name needs to be more than 2 characters',
        too_long: 'Drug name can not be more than 256 characters in length' }

  acts_as_votable

  has_many :prices
  has_many :suggestion_terms

  has_many :drug_categories
  has_many :categories, through: :drug_categories

  has_many :drug_generics
  has_many :generics, through: :drug_generics

  has_many :rx_items
  has_many :rxes, through: :rx_items

  belongs_to :country
  belongs_to :company
  belongs_to :form

  # todo: add at least ten scopes to sort drugs with
  scope :popular, -> {order(:visit_count, :desc)}

  def to_s
    "{ name: #{name}, company: #{company.name}, country: #{country.name}}"
  end

  def current_price

  end

  def future_price

  end

  def old_price

  end

  def self.suggestion_for(term)
    Drug.joins(:suggestion_terms)
        .where('suggestion_terms.term like ?', "%#{term}%")
        .group(:id)
  end
end
