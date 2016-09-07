class Blog < Obj
	attribute :page_title, :string
	attribute :title, :string

	def latest_posts(page=0, count=10)
		BlogPost.all
			.offset(page * count)
			.batch_size(count)
			.order(:published_at)
			.reverse_order
			.take(count)
	end

	def info_for_content_browser
		"title: #{page_title}"
	end
end