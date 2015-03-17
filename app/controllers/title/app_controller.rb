require_dependency "title/application_controller"

module Title
  class AppController < ApplicationController
    before_filter :load_title_yml

    def index
    end

    def save
      key="#{params[:set_controller]}\##{params[:set_action]}"
      val= params[:title].split(',')
      @titles_hash.present? ? @titles_hash[key] = val : @titles_hash = {"#{key}" => ["#{params[:title]}"]}
      # @titles_hash = {"#{key}" => ["#{params[:title]}"]}
      File.open(@file_path, 'w+') { |f| f.write (@titles_hash).to_yaml } #Store
      render nothing: true, status: 200
    end

    private
    def load_title_yml
      @file_path = File.join(Rails.root, 'page_title.yml')
      @titles_hash = ((YAML::load_file(@file_path) rescue nil)|| {})

    end
  end
end
