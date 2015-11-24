require 'rails/generators/base'

class Adminlte2::ViewsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  class_option :stylesheet_engine

  def view
    stylesheet_extension = options[:stylesheet_engine] || 'css'

    inject_into_file "app/assets/stylesheets/application.#{stylesheet_extension}", "@import \"AdminLTE2/skins/skin-blue.min\";\n", after: ' */'
    inject_into_file "app/assets/stylesheets/application.#{stylesheet_extension}", "@import \"AdminLTE2/app.min\";\n", after: ' */'
    inject_into_file "app/assets/stylesheets/application.#{stylesheet_extension}", "\n\n@import \"bootstrap.min\";\n", after: ' */'

    inject_into_file 'app/assets/javascripts/application.js', "//= require bootstrap.min\n", before: "//= require_tree ."
    inject_into_file 'app/assets/javascripts/application.js', "//= require AdminLTE2/app.min\n", before: "//= require_tree ."

    # inject_into_application_javascript('AdminLTE2/app', before: '//= require_tree')
    %i(_control_sidebar _default_content _footer _header _main_sidebar application).each do |file|
      copy_file "#{file}.html.erb", "app/views/layouts/adminlte2/#{file}.html.erb"
    end

    #
    # if yes?('Add layout to ApplicationController ? (y/n) ')
    #   inject_into_file 'app/controllers/application_controller.rb', "\n  layout 'admin_lte_2'\n", after: 'class ApplicationController < ActionController::Base'
    # end
    #
    # if yes?('Login Page ? (y/n)')
    #   copy_file 'admin_lte_2_login.html.erb', 'app/views/layouts/admin_lte_2_login.html.erb'
    # end
    #
    # if yes?('Devise ? (y/n) ')
    #   gem 'devise'
    #
    #   run 'bundle install'
    #   generate 'devise:install'
    #
    #   inject_into_file 'app/controllers/application_controller.rb', "\n  before_action :authenticate_user!\n", after: 'class ApplicationController < ActionController::Base'
    #
    #   environment "
    #   config.to_prepare do
    #     Devise::SessionsController.layout 'admin_lte_2_login'
    #   end
    #   "
    # end
  end

  private

  def inject_into_application_stylesheet(file)
    stylesheet_extension = options[:stylesheet_engine] || 'css'
    inject_into_file "app/assets/stylesheets/application.#{stylesheet_extension}", " *= require #{file}\n", before: ' *= require_self'
  end

  def inject_into_application_javascript(file, before: '//= require app')
    inject_into_file 'app/assets/javascripts/application.js', "//= require #{file}\n", before: before
  end

end


