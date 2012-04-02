require "minitest_helper"

class TestOffering < MiniTest::Unit::TestCase
  
  def setup
    @male_person = Person.create( name: "John Q", sex: "M" )
    @female_person = Person.create( name: "Hosey", sex: "F" )
    @male_offer = Offer.create( text: "Buy One Get One Free", value: 25, for_sex: "M" )
    @female_offer = Offer.create( text: "10% off next order", value: 15, for_sex: "F" )
  end
  
  def test_when_perfect_should_be_valid
    @offering = Offering.new
    @offering.person = @male_person
    @offering.offer = @male_offer
    assert @offering.save, true
  end
  
  def test_an_offering_cannot_be_created_that_does_not_match_persons_sex
    offering = Offering.new
    offering.person = @male_person
    offering.offer = @female_offer
    assert_equal offering.save, false
  end
  
  def test_an_offering_with_the_same_person_and_offer_should_not_be_valid
    o1 = Offering.new
    o1.offer = @male_offer
    o1.person = @male_person
    o1.save
    o2 = Offering.new
    o2.offer = @male_offer
    o2.person = @male_person
    assert o2.save != true
  end
  
  def test_an_offering_cannot_be_created_if_the_person_has_already_accepted_five_offerings
    5.times do |i|
      offer = Offer.create!( value: i + 1, text: "I am #{ i }", for_sex: "M" )
      offering = Offering.new
      offering.person = @male_person
      offering.offer = offer
      offering.accepted = true
      offering.save
    end
    
    offering = Offering.new
    offering.person = @male_person
    offering.offer = Offer.create!( value: 100, text: "I am 100", for_sex: "M" )
    assert_equal offering.save, false 
  end
  
  def test_assert_equal
    assert_false 1 == 0 
  end

end