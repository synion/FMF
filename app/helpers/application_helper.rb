module ApplicationHelper
	def link_to_add_switchgears(name, f, association)
		new_object = f.object.send(association).klass.new
		id = new_object.object_id
		switchgears = f.fields_for(association, new_object, child_index: id) do |builder|
			render(association.to_s.singularize + "_filed", f: builder )
		end
		link_to(name, '#', class: "add_switchgears", data: {id: id,  switchgears: fields.gsub("\n", "")})
	end

	
  
end
