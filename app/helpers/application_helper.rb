module ApplicationHelper
	def title(*parts)
		unless parts.empty?
			content_for	:title
				(parts << "Ticktee").join("-") unless parts.empty?
			end
		end
	end
end
