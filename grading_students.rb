def grading_students(grades)

  modified = grades.map do |grade|
    if grade < 38
      grade
    elsif (5 - (grade % 5)) <= 2
      grade + (5 - (grade % 5))
    else
      grade
    end
  end

  puts modified
end

test_a = [73, 67, 38, 33]

grading_students(test_a)
