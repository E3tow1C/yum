class Course < ApplicationRecord
  has_many :school_courses
  has_many :schools, through: :school_courses
end
