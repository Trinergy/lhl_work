class Employee < ActiveRecord::Base
  belongs_to :store
  validates :first_name, presence: true
  validates :last_name, presence: true
  after_create :add_employee_count, if: :store
  after_destroy :remove_employee_count, if: :store

  def annual_salary
    hourly_rate * 1950
  end

  def self.average_hourly_rate_for(gender)
    gender.nil? ? (Employee.all.average(:hourly_rate)).round(2) : (Employee.where(gender: gender).average(:hourly_rate)).round(2)
    # if gender.nil?
    #   employees = Employee.all
    #   # employees.each do |employee|
    #   #   average_hourly_rate += employee.hourly_rate
    #   employees.sum(:hourly_rate) / employees.count.to_f
    # else
    #   employees = Employee.where(gender: gender)
    #   # employees.each do |employee|
    #   #   average_hourly_rate += employee.hourly_rate
    # end
    # (employees.sum(:hourly_rate) / employees.count.to_f).round(2)
    # employees.average(:hourly_rate)
  end






  private
    def add_employee_count
      if gender == 'F'
        store.female_employees += 1
        store.save
      else
        store.male_employees += 1
        store.save
      end
    end

    def remove_employee_count
      if gender == 'F'
        store.female_employees -= 1
        store.save
      else
        store.male_employees -= 1
        store.save
      end
    end

  
end
