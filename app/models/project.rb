class Project < ApplicationRecord
  validates :name, presence: true

  has_many :grades, :dependent => :destroy
  
  accepts_nested_attributes_for :grades

  def done
    self.status = "concluido"
    self.conclusion_date = DateTime.now
  end

  def archive
    self.archived = true
    self.archived_date = DateTime.now
  end
end
