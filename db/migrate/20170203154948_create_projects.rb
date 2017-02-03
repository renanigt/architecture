class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :client
      t.date :conclusion_date
      t.string :status
      t.boolean :archived
      t.date :archived_date

      t.timestamps
    end
  end
end
