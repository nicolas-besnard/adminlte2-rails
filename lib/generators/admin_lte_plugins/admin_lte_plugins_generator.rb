class AdminLtePluginsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :plugin_name, type: :string

  #
  def main
    begin
      send("install_#{plugin_name}")
    rescue => e
      puts "ok"
    end
  end

  private

  def install_j_vector_map
    copy_file 'jVectorMap/jquery-jvectormap-1.2.2.css', 'vendor/assets/stylesheets/jquery-jvectormap-1.2.2.css'
    copy_file 'jVectorMap/jquery-jvectormap-1.2.2.min.js', 'vendor/assets/javascripts/jquery-jvectormap-1.2.2.min.js'
    copy_file 'jVectorMap/jquery-jvectormap-world-mill-en.js', 'vendor/assets/javascripts/jquery-jvectormap-world-mill-en.js'

    inject_into_file 'app/assets/javascripts/application.js', "//= require jquery-jvectormap-1.2.2.min\n", before: '//= require_tree .'
    inject_into_file 'app/assets/javascripts/application.js', "//= require jquery-jvectormap-world-mill-en\n", before: '//= require_tree .'

    inject_into_file 'app/assets/stylesheets/application.css', " *= require jquery-jvectormap-1.2.2\n", before: ' *= require_self'
  end

  def install_chart_js
    copy_file 'ChartJS/Chart.js', 'vendor/assets/javascripts/Chart.js'

    inject_into_file 'app/assets/javascripts/application.js', "//= require Chart\n", before: '//= require_tree .'
  end

  def install_sparkline
    copy_file 'Sparkline/jquery.sparkline.js', 'vendor/assets/javascripts/jquery.sparkline.js'

    inject_into_file 'app/assets/javascripts/application.js', "//= require jquery.sparkline\n", before: '//= require_tree .'
  end

end
