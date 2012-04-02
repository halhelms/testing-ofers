require "minitest_helper"

class TestOffer < MiniTest::Unit::TestCase
  
  def setup
    @offer = Offer.new( value: 1, text: "hello world", for_sex: "M" )
  end
  
  def test_that_perfect_inputs_are_valid
    assert @offer.save
  end
  
  def test_a_non_positive_value_is_not_valid
    @offer.value = -57
    assert_equal @offer.save, false
  end
  
  def test_that_text_with_no_length_is_not_valid
    @offer.text = ""
    assert !@offer.save 
  end
  
  def test_that_text_of_nil_is_not_valid
    @offer.text = nil
    assert !@offer.save
  end
  
  def test_that_for_sex_of_all_is_not_valid
    @offer.for_sex = :all
    assert !@offer.save
  end

end