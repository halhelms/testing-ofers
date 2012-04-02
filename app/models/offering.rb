class Offering < ActiveRecord::Base
  belongs_to :offer
  belongs_to :person
  
  validate :offer_and_person_sex_must_match, :offering_cannot_be_created_if_person_has_reached_limit
  validates_uniqueness_of :offer_id, :scope => [ :person_id ]
  
  LIMIT = 5

  
  scope :accepted, where( accepted: true )
  scope :unaccepted, where( accepted: false )
  
  def offer_and_person_sex_must_match
    if offer.for_sex != person.sex
      errors[ :base ] << "The offer and the person must have the same sex"
    end
  end
  
  def offering_cannot_be_created_if_person_has_reached_limit
    errors[ :base ] << "C'mon. You can't create that many offers!" if person.offerings.accepted.count >= LIMIT
  end
end
