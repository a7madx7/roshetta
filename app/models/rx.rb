class Rx < ApplicationRecord
  attr_writer :current_step

  validates :password, presence: true, length: { minimum: 4, maximum: 64 }, if: lambda { |o| o.current_step == 'encryption' }


  def current_step
    @current_step || steps.first
  end 
  def steps
    %w{initial encryption filling finalization}
  end

  def next_step
    self.current_step = steps[steps.index(current_step) + 1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step) - 1]
  end

  def first_step?
    @current_step == steps.first
  end

  def last_step?
    @last_step == steps.last
  end
  def all_valid?
    steps.all? do |step|
      self.current_step = step
      valid?
    end
  end 
  
  acts_as_votable

  has_many :rx_items
  has_many :drugs, through: :rx_items
end