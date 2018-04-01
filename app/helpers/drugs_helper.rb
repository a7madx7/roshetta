module DrugsHelper
  def drugs_by_price_pie
    pie_chart @drugs.top(:price, 33), height: '500px', library: library('Top 33 pricing tags for drugs', 'Each price tag', 'Drug count per price tag')
  end

  def drugs_by_price_bar
    bar_chart @drugs.top(:price, 33), height: '500px', library: library('Top 33 pricing tags for drugs', 'Each price tag','Drug count per price tag')
  end

   def drugs_by_price_line
    line_chart @drugs.top(:price, 33), height: '500px', library: library('Top 33 pricing tags for drugs', 'Each price tag','Drug count per price tag')
  end

   def drugs_by_price_column
    column_chart @drugs.top(:price, 33), height: '500px', library: library('Top 33 pricing tags for drugs', 'Each price tag','Drug count per price tag')
  end


  def drugs_by_market_status
    pie_chart @drugs.group(:market_status).count
  end

  def drugs_by_availability
    pie_chart @drugs.group(:available).count
  end
end
