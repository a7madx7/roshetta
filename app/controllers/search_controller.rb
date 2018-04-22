class SearchController < ApplicationController
  before_action :set_term
  # @return [{data: result_data, type: result_type}]
  def for
    # TODO: make search terms dynamic in the database.
    if @term.downcase =~ SearchEngine.where(model_name: 'Rx').first.regex
      @results = { data: Rx.where(id: Regexp.last_match(2)).first,
                   type: 'Prescription' }
    elsif @term.downcase =~ SearchEngine.where(model_name: 'Drug').first.regex
      @results = { data: Drug.name_like(Regexp.last_match(2)).first(10),
                   type: 'Drug'}
    elsif @term.downcase =~ SearchEngine.where(model_name: 'Generic').first.regex
      @results = { data: Generic.name_like(Regexp.last_match(2)).first(10),
                   type: 'Generic' }
      # @results = { data: Generic.name_like(@term.tr('$', '')).first(10), type: 'Generic' }
    elsif @term.downcase =~ SearchEngine.where(model_name: 'Suggestion').first.regex
      # elsif @term.downcase.start_with?('!', 'suggest')
      @results = { data: Drug.suggestion_for(Regexp.last_match(2)).first(10),
                   type: 'Drug' }
    elsif @term.downcase =~ SearchEngine.where(model_name: 'Category').first.regex
      @results = { data: Category.name_like(Regexp.last_match(2)).first(10),
                   type: 'Drug Category' }
    end

    respond_to do |format|
      format.html { return @results }
      format.json { render json: @results }
    end 
  end

  def drugs; end

  def rxes; end

  private

  # @return [search term]
  def set_term
    @term = params[:term]
  end
end
