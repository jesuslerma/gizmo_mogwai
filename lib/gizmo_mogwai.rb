require "gizmo_mogwai/version"
require 'erb'
require 'rspec_kickstarter'
require 'gizmo_mogwai/generator'

module GizmoMogwai
  def self.clone_mogwai(project_dir, template_file, spec_dir)
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
