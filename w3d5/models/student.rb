class Student < ActiveRecord::Base

  has_many :enrollments, dependent: :destroy

  def elective_credits
    enrollments.where(elective: true).joins(:course).sum(:credits)
  end

end
