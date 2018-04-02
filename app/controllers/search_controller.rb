class SearchController < ApplicationController
  before_action :set_term
  def for
    if @term.start_with?('#')
      @results = { data: Rx.where(id: @term.tr('#', '')).first, type: 'Prescription' }
    elsif @term.start_with?('@')
      @results = { data: Drug.name_like(@term.tr('@', '')).first(10), type: 'Drug'}
    elsif @term.start_with?('$')
      @results = { data: Generic.name_like(@term.tr('$', '')).first(10), type: 'Generic' }
    end

    respond_to do |format|
      format.html { }
      format.json { render json: @results }
    end 
  end

  def drugs
  end

  def rxes
  end

  private

    def set_term
      @term = params[:term]
    end
end
