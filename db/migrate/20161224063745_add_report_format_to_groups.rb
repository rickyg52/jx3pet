class AddReportFormatToGroups < ActiveRecord::Migration[5.0]
  def change
  	add_column :groups, :report_format, :string, :null => false, :default => '{time} {alias} 502'
  end
end
