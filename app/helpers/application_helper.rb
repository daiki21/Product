module ApplicationHelper

	def bootstrap_class_for(t)
		if t == "success"
			return "alert-success"
		elsif t == "error"
			return "alert-danger"
		else
			return "alert-info"
		end
	end
end
