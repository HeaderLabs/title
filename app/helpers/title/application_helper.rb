module Title
  module ApplicationHelper

    def full_title(page_title = nil)
      key = "#{params[:controller]}\##{params[:action]}"
      #data =YAML::load_file(File.join(Rails.root, 'page_title.yml'))
      @file_path = File.join(Rails.root, 'page_title.yml')
      data = ((YAML::load_file(@file_path) rescue nil)|| {})
      title = [data['root-name']]
      value = data[key]
      unless value.nil?
        if value.is_a?(Array)
          value = data[key].map(&:to_s)
          value.map { |v| title << (v.include?('@') ? eval(v) : v) }
        else
          title << (value.include?('@') ? eval(value) : value)
        end
        title.join(' | ')
      end
    end

    def form_index
      render template: 'title/app/index'
    end
  end
end
