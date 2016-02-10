describe Student do

  describe '#elective_credits' do

    it 'should return the number of elective credits due to the student' do
      course_a = FactoryGirl.create(:course)
      course_b = FactoryGirl.create(:course)
      student = FactoryGirl.create(:student)
      student.enrollments.create(course: course_a, elective: false)
      student.enrollments.create(course: course_b, elective: true)
      expect(student.elective_credits).to eq(course_b.credits)
    end

  end

end
