class Offer < ActiveRecord::Base
  validates :value, :numericality => { :greater_than => 0 }
  validates :text, :length => { :minimum => 1 }
  validates :for_sex, :inclusion => { :in => %w(M F) }
  
  has_many :offerings
  has_many :people, :through => :offerings
end
