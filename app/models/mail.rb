class Mail < ActiveRecord::Base
 
  has_and_belongs_to_many :patients
  attr_accessible :body, :subject, :patients_attributes
  accepts_nested_attributes_for :patients, :reject_if => lambda { |a| a[:name].blank? }

end
