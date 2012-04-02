require "minitest_helper"

class TestPerson < MiniTest::Unit::TestCase
  
  def setup
    @person = Person.create!( name: "John Q", sex: "M" )
  end
  
  def test_that_a_person_missing_name_is_not_valid 
    @person.name = ""
    assert_equal @person.save, false
  end
  
  def test_that_a_person_with_no_sex_is_not_valid
    @person.sex = nil
    assert_equal @person.save, false
  end
  
  def test_that_a_person_does_not_accept_more_than_five_valid_offerings
    offerings = []
    6.times do |i|
      offering = Offering.new
      offering.person = @person
      offering.offer = Offer.create!( text: "Here is an offer", value: i + 1, for_sex: "M" )
      offering.save    
      offerings << offering 
    end
    
    5.times do |i|
      @person.accept_offering( offerings[ i ] )
    end
    
    assert_equal @person.accept_offering( offerings.last ), false
  end

end