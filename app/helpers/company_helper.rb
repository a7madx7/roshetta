module CompanyHelper
  def companies_by_market_share_bar
    bar_chart Drug.all.group(:company).count, height: '500px', library: library('Company market share', 'Company', 'Drug count per company')
  end

  def companies_by_market_share_pie
    pie_chart Drug.all.group(:company).count, height: '500px', library: library('Company market share', 'Company', 'Drug count per company')
  end

  def companies_by_market_value_column
    column_chart Drug.all.group(:company).sum(:price), height: '500px', library: library('Total value of all company drugs', 'Company', 'Total Value')
  end

  def companies_by_drug_count_bar
    bar_chart Company.all.joins(:drugs).count(:drug_id)
  end

  def popular_companies_by_drug_visits_bar_chart

    # bar_chart Company.joins(:drugs).group_by(:visit_count), height: '500px', library: library('Company popularity by drug visits', 'Company', 'Drug visits')
  end

end
