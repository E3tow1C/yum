class SchoolCourse < ApplicationRecord
  belongs_to :schools
  belongs_to :courses
end
