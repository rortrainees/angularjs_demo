class Student < ActiveRecord::Base
	  validates :name, :clas, :age,  presence: true


  
end
