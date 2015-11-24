require 'rails/generators/base'

class Adminlte2::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  class_option :stylesheet_engine

  def install
    stylesheet_extension = options[:stylesheet_engine] || 'css'

    inject_into_file "app/assets/stylesheets/application.#{stylesheet_extension}", "@import \"AdminLTE2/skins/skin-blue.min\";\n", after: ' */'
    inject_into_file "app/assets/stylesheets/application.#{stylesheet_extension}", "@import \"AdminLTE2/app.min\";\n", after: ' */'
    inject_into_file "app/assets/stylesheets/application.#{stylesheet_extension}", "\n\n@import \"bootstrap.min\";\n", after: ' */'

    inject_into_file 'app/assets/javascripts/application.js', "//= require bootstrap.min\n", before: "//= require_tree ."
    inject_into_file 'app/assets/javascripts/application.js', "//= require AdminLTE2/app.min\n", before: "//= require_tree ."
  end
end


