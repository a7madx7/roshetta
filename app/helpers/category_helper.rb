module CategoryHelper
  def category_by_popularity
    pie_chart @categories.top(:name, 33), height: '500px', library: library('Top 33 Drug categories', '', '')
  end
end
