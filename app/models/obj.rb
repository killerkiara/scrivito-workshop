class Obj < Scrivito::BasicObj
	def self.valid_page_classes_beneath(parent_path)
		[Page, Blog]
	end
end
