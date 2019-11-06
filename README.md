nested_students = [
  ["Mike", "Grade 10", "A average"],
  ["Tim", "Grade 10", "C average"],
  ["Monique", "Grade 11", "B average", "Class President"]
]
 
nested_students.each do |student_array|
  student_array.each do |student_detail|
    puts student_detail
  end
end