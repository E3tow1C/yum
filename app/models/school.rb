class School < ApplicationRecord
  has_many :school_courses
  has_many :courses, through: :school_courses
end
