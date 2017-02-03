class Grade < ApplicationRecord
  def archive
    self.archived = true
    self.archived_date = DateTime.now
  end
end
