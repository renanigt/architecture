class AddColumnsToGrades < ActiveRecord::Migration[5.0]
  def change
    add_column :grades, :archived, :boolean
    add_column :grades, :archived_date, :date
  end
end
