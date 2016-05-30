class Profile < ActiveRecord::Base
  	belongs_to :user

	validate :validations

	def validations
		if first_name.nil? && last_name.nil?
			errors.add(:last_name, "Only one can be null")
		end
		if gender != "male" && gender != "female"
			errors.add(:gender, "Only can be male or female")
		end
		if gender == "male" && first_name == "Sue" && gender != "female"
			errors.add(:gender, "Gender male can not be male or female")
		end
	end

	scope :get_all_profiles, -> (startYear, endYear){ where("birth_year BETWEEN ? AND ?", "#{startYear}", "#{endYear}")
		.order('birth_year ASC') }

end
