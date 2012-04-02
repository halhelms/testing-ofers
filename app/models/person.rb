class Person < ActiveRecord::Base
  validates :name, :presence => true
  validates :sex, :presence => true, :inclusion => { :in => %w(M F) }
  
  has_many :offerings
  has_many :offers, :through => :offerings
  
  def accept_offering( offering )
    offering.accepted = true
    saved = offering.save
    
    if self.offerings.accepted.count > Offering::LIMIT
      self.offerings.unaccepted.each do |offering|
        offering.destroy
      end
    end
    saved
  end
end
