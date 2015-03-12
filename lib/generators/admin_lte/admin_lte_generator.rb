class AdminLteGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  class_option :stylesheet_engine

  def main
    stylesheet_extension = options[:stylesheet_engine] || 'css'

    inject_into_file 'app/assets/javascripts/application.js', "//= require bootstrap\n", before: '//= require_tree .'
    inject_into_file 'app/assets/javascripts/application.js', "//= require app\n", before: '//= require_tree .'

    inject_into_file "app/assets/stylesheets/application.#{stylesheet_extension}", " *= require bootstrap\n", before: ' *= require_self'
    inject_into_file "app/assets/stylesheets/application.#{stylesheet_extension}", " *= require AdminLTE\n", before: ' *= require_self'
    inject_into_file "app/assets/stylesheets/application.#{stylesheet_extension}", " *= require skins/skin-blue\n", before: ' *= require_self'

    copy_file '_admin_lte_2_header.html.erb', 'app/views/layouts/_admin_lte_2_header.html.erb'
    copy_file '_admin_lte_2_sidebar.html.erb', 'app/views/layouts/_admin_lte_2_sidebar.html.erb'
    copy_file 'admin_lte_2.html.erb', 'app/views/layouts/admin_lte_2.html.erb'

    if yes?('Add layout to ApplicationController ? (y/n) ')
      inject_into_file 'app/controllers/application_controller.rb', "\n  layout 'admin_lte_2'\n", after: 'class ApplicationController < ActionController::Base'
    end

    if yes?('Devise ? (y/n) ')
      gem 'devise'

      run 'bundle install'
      generate 'devise:install'

      environment "
      config.to_prepare do
        Devise::SessionsController.layout 'admin_lte_2_login'
      end
      "

      inject_into_file 'app/controllers/application_controller.rb', "\n  before_action :authenticate_user!\n", after: 'class ApplicationController < ActionController::Base'

      copy_file 'admin_lte_2_login.html.erb', 'app/views/layouts/admin_lte_2_login.html.erb'
    end
  end
end
