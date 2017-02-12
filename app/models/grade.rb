class Grade < ApplicationRecord
  validates :grade, :project_id, presence: true

  def archive!
    self.archived = true
    self.archived_date = DateTime.now
  end
end
