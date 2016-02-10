class Store < ActiveRecord::Base
  has_many :employees
  validates :name, presence: true,
                   length: { maximum: 25 }
  validates :annual_revenue, numericality: { only_integer: true,
                                             greater_than_or_equal_to: 0 }
  validates :male_employees, numericality: { only_integer: true,
                                             greater_than_or_equal_to: 0 }
  validates :female_employees, numericality: { only_integer: true,
                                             greater_than_or_equal_to: 0 }
                                            

  
  def annual_profit
    annual_revenue - annual_expense
  end

  def annual_expense
    # annual_expense = 0
    # #can also inject
    # employees.each do |employee|
    #   annual_expense += employee.annual_salary
    # end
    # annual_expense
    employees.calculate(:sum, :hourly_rate) * 1950
  end                                                                              

end
