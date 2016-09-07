class PersonWidget < Widget
	attribute :person, :reference, only: Person

	def person_obj

	end
end