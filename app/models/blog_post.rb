class BlogPost < Obj
	attribute :author_name, :string
	attribute :body, :widgetlist
	attribute :page_title, :string, default: '[New Blog Post]'
	attribute :published_at, :date
	attribute :title, :string
	attribute :related_links, :linklist

	default_for :title do |attribute|
		if attribute[:_path].starts_with?('/en')
			'[New Blog Post]'
		else
			'[Nuovo Post]'
		end
	end

	def menu_title
		self[:page_title] || self[:title]
	end

	def valid_widget_classes_for(field_name)
  	case field_name
  	when 'body'
  		[
  			TextWidget,
  			HeadlineWidget,
  			ImageWidget,
  			TeaserWidget
  		]
  	else
  		[]
  	end
  end
end