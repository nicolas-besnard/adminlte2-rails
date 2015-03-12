class AdminLtePluginsGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :plugin_name, type: :string

  #
  def main
    begin
      send("install_#{plugin_name}")
    rescue NoMethodError => e
      puts "Unknown plugin : '#{plugin_name}'"
    rescue => e
      puts e
    end
  end

  private

  def install_j_vector_map
    add_plugin('jVectorMap', 'css', 'jquery-jvectormap-1.2.2')
    add_plugin('jVectorMap', 'js', 'jquery-jvectormap-1.2.2.min')
    add_plugin('jVectorMap', 'js', 'jquery-jvectormap-world-mill-en')
  end

  def install_chart_js
    add_plugin('ChartJS', 'js', 'chart')
  end

  def install_sparkline
    add_plugin('Sparkline', 'js', 'jquery.sparkline')
  end

  def install_bootstrap_slider
    add_plugin('bootstrap-slider', 'css', 'slider')
    add_plugin('bootstrap-slider', 'js', 'bootstrap-slider')
  end

  def install_bootstrap_wysihtml5
    add_plugin('bootstrap-wysihtml5', 'css', 'bootstrap3-wysihtml5')
    add_plugin('bootstrap-wysihtml5', 'js', 'bootstrap3-wysihtml5')
  end

  def install_fullcalendar
    add_plugin('fullcalendar', 'css')
    add_plugin('fullcalendar', 'js')
  end

  def install_knob
    add_plugin('knob', 'js', 'jquery.knob')
  end

  def install_timepicker
    add_plugin('timepicker', 'css', 'bootstrap-timepicker')
    add_plugin('timepicker', 'js', 'bootstrap-timepicker')
  end

  def install_pace
    add_plugin('pace', 'js')
  end

  def install_morris
    add_plugin('morris', 'js')
    add_plugin('morris', 'css')
  end

  def install_daterangepicker
    add_plugin('daterangepicker', 'js')
    add_plugin('daterangepicker', 'css', 'daterangepicker-bs3')
  end

  def install_colorpicker
    add_plugin('colorpicker', 'js', 'bootstrap-colorpicker')
    add_plugin('colorpicker', 'css', 'bootstrap-colorpicker')

    plugin_directory = File.expand_path('../templates', __FILE__) + '/colorpicker'
    directory "#{plugin_directory}/img", "vendor/assets/stylesheets/img"
  end

  def install_datepicker
    add_plugin('datepicker', 'js', 'bootstrap-datepicker')
    add_plugin('datepicker', 'css', 'datepicker3')

    plugin_directory = File.expand_path('../templates', __FILE__) + '/datepicker'
    directory "#{plugin_directory}/locales", 'vendor/assets/javascripts/locales'
  end

  def install_slimscroll
    add_plugin('slimscroll', 'js', 'jquery.slimscroll')
  end

  # ------------------------------ #

  def add_plugin(plugin_directory, type, plugin_file = nil)
    plugin_file ||= plugin_directory
    plugin_file_with_extension = "#{plugin_file}.#{type}"

    if type == 'css'
      inject_into_file  'app/assets/stylesheets/application.css', " *= require #{plugin_file}\n", before: ' *= require_self'
      copy_file "#{plugin_directory}/#{plugin_file_with_extension}", "vendor/assets/stylesheets/#{plugin_file_with_extension}"
    else
      inject_into_file  'app/assets/javascripts/application.js', "//= require #{plugin_file}\n", before: '//= require_tree .'
      copy_file "#{plugin_directory}/#{plugin_file_with_extension}", "vendor/assets/javascripts/#{plugin_file_with_extension}"
    end
  end
end
