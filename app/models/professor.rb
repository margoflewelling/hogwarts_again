class Professor <ApplicationRecord
  validates_presence_of :name, :age, :specialty

  has_many :professor_students
  has_many :students, through: :professor_students

  def avg_student_age
    sum_ages = students.sum {|student|student.age}
    (sum_ages.to_f/students.count).round(2)
  end
end
