class ChangeColumnToHabCodes < ActiveRecord::Migration
  def change
    change_column :hab_codes, :registered, :boolean, :default => false
    change_column :hab_codes, :assigned, :boolean, :default => false
    change_column :hab_codes, :debriefed, :boolean, :default => false
    change_column :hab_codes, :report_sent, :boolean, :default => false
  end
end

