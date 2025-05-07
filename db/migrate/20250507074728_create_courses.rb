class CreateCourses < ActiveRecord::Migration[8.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :hours
      t.integer :credit

      t.timestamps
    end
  end
end
