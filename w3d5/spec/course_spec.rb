describe Course do

  before :each do
    @course = FactoryGirl.build(:course)
  end

  describe 'validations' do

    it 'should be valid if dates are in order' do
      expect(@course).to be_valid
    end

    it 'should be invalid if dates are out of order' do
      @course.starts_at = '2016-05-01'
      @course.ends_at = '2016-01-01'
      expect(@course).to_not be_valid
      expect(@course.errors[:starts_at]).to include('cannot come after ends at')
    end

    it 'should be valid if missing dates' do
      course = FactoryGirl.build(:course, starts_at: nil, ends_at: nil)
      expect(course).to be_valid
      course = FactoryGirl.build(:course, starts_at: nil)
      expect(course).to be_valid
      course = FactoryGirl.build(:course, ends_at: nil)
      expect(course).to be_valid
    end

  end

  describe '#course_length' do

    it 'returns the number of days between starts_at and ends_at' do
      expect(@course.course_length).to eq(121)
      @course.starts_at  = nil
      expect(@course.course_length).to be_nil
    end

  end

end
