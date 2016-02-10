class CreateTables < ActiveRecord::Migration

  def change
    create_table :students do |t|
      t.string :name
      t.string :student_number
      t.timestamps null: false
    end
    create_table :courses do |t|
      t.string :name
      t.integer :credits
      t.date :starts_at
      t.date :ends_at
      t.timestamps null: false
    end
    create_table :enrollments do |t|
      t.boolean :elective
      t.references :course
      t.references :student
      t.timestamps null: false
    end
  end

end
