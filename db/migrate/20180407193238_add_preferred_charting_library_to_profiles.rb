class AddPreferredChartingLibraryToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :preferred_charting_library, :string, default: 'highcharts'
  end
end
