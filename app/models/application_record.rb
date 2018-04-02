class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.name_like(term)
    where(name_condition(term))
  end

  def self.name_condition(term)
    ['name like ?', "%#{term}%"]
  end
end
