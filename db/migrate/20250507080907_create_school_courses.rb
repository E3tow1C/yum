class CreateSchoolCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :school_courses do |t|
      t.references :schools, null: false, foreign_key: true
      t.references :courses, null: false, foreign_key: true
      t.string :teacher_name
      t.integer :capacity
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
