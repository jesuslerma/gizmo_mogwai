require "gizmo_mogwai/version"
require 'erb'
require 'rspec_kickstarter'

module GizmoMogwai
	class Generator < Thor
		include Thor::Actions
	  def clone_mogwai(file_name, options)
	  	template_file = options[:template_file]
			project_dir = options[:project_dir]
			spec_dir = options[:spec_dir]
			spec_template = options[:spec_template]

			file_path = "#{project_dir}/#{file_name}.rb"
			template = ERB.new File.new(template_file).read, nil, "%"
			@class_name = file_name.split('_').map{|word| word.capitalize}.join('')
			
			create_file file_path do
				template.result binding
			end
			generator = RSpecKickstarter::Generator.new(spec_dir)
	    generator.write_spec(file_path, false, false)
	  end
	end
end
