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
  scope :most_visited, -> { order(visit_count: :desc) }
  scope :least_visited, -> { order(visit_count: :asc) }
  scope :most_shared, -> { }
  scope :least_shared, -> { }
  scope :most_liked, -> { order(cached_votes_up: :desc) }
  scope :least_liked, -> { order(cached_votes_up: :asc) }
  scope :most_hated, -> { order(cached_votes_down: :desc) }
  scope :least_hated, -> { order(cached_votes_down: :asc) }

  scope :popular, -> { order(prescribe_count: :desc) }
  def to_s
    "{ name: #{name}, company: #{company.name}, country: #{country.name}}"
  end

  def self.suggestion_for(term)
    Drug.joins(:suggestion_terms)
        .where('suggestion_terms.term like ?', "%#{term}%")
        .group(:id)
  end

  def current_price
     prices.where('prices.current = ?', true).first
  end

  def future_price

  end

  def old_price

  end

  def name_without_suffix
    names = name.partition(" ")
    names.reject! { |name| name == names.last }
    names.reject! { |name| name == names.last }
    names
  end
end
