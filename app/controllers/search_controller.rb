class SearchController < ApplicationController
  def for
    @term = params[:term]
    if @term.start_with?('#')
      @results = { data: Rx.where(id: @term.tr('#', '')).first, type: 'Prescription' }
    else
      @results = { data: Drug.where('name like ?', "%#{@term}%").first(33), type: 'Drug' }
    end

    respond_to do |format|
      format.html { }
      format.json { }
    end 
  end

  def drugs
  end

  def rxes
  end
end
