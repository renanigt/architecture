class CreateGrades < ActiveRecord::Migration[5.0]
  def change
    create_table :grades do |t|
      t.belongs_to :project
      t.float :grade

      t.timestamps
    end
  end
end
