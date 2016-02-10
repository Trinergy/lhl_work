class Course < ActiveRecord::Base

  validate :dates_are_in_order

  def course_length
    ends_at - starts_at if starts_at && ends_at
  end

  protected

    def dates_are_in_order
      if starts_at && ends_at && starts_at > ends_at
        errors.add(:starts_at, 'cannot come after ends at')
      end
    end

end
