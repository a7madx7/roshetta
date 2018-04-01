module CompanyHelper
  def companies_by_market_share_bar
    bar_chart @drugs.group(:company).count, height: '500px', library: library('Company market share', 'Company', 'Drug count per company')
  end

  def companies_by_market_share_pie
    pie_chart @drugs.group(:company).count, height: '500px', library: library('Company market share', 'Company', 'Drug count per company')
  end

  def companies_by_market_value_column
    column_chart @drugs.group(:company).sum(:price), height: '500px', library: library('Total value of all company drugs', 'Company', 'Total Value')
  end

end
