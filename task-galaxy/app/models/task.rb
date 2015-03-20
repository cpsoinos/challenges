class Task < ActiveRecord::Base

  def due_date_is_date?
    if !self.due_date.is_a?(Date)
      errors.add(:due_date, 'must be a valid date')
    end
  end

  validates :name, presence: true
  validates :project_id, presence: true
  validate :due_date_is_date?

  belongs_to :project
  belongs_to :user
end
