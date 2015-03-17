module Title
  class Engine < ::Rails::Engine
    isolate_namespace Title
  end

  class Railtie < ::Rails::Railtie
    initializer "title.view_helpers" do
      ActionView::Base.send :include, Title::ApplicationHelper
    end
  end
end
