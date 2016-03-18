class CreateHabCodes < ActiveRecord::Migration
  def change
    create_table :hab_codes do |t|
      t.string :code
      t.string :last_name
      t.string :first_name
      t.string :email
      t.datetime :date_sent
      t.boolean :registered
      t.boolean :assigned
      t.datetime :completed
      t.boolean :debriefed
      t.boolean :report_sent
      t.references :coach, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
