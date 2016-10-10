require_dependency "title/application_controller"

module Title
  class AppController < ApplicationController
    before_action :load_title_yml
    before_action :set_root_name

    def index
    end

    def save
      key="#{params[:set_controller]}\##{params[:set_action]}"
      val= params[:title].split(',')
      @titles_hash.present? ? @titles_hash[key] = val : @titles_hash = {"#{key}" => ["#{params[:title]}"]}
      # @titles_hash = {"#{key}" => ["#{params[:title]}"]} #Store hash in @title_hash
      File.open(@file_path, 'w+') { |f| f.write (@titles_hash).to_yaml }
      render nothing: true, status: 200
    end

    private
    def load_title_yml
      @file_path = File.join(Rails.root, 'page_title.yml')
      @titles_hash = ((YAML::load_file(@file_path) rescue nil)|| {})

    end

    def set_root_name
      @project_title = @titles_hash['root-name'].nil? ? @titles_hash['root-name'] = Rails.application.class.name : @titles_hash['root-name']
      File.open(@file_path, 'w+') { |f| f.write (@project_title).to_yaml }
    end
  end
end
