module LiveSlides
  class Railtie < ::Rails::Railtie
    # Railtie code here
    initializer "liveslides_railtie.configure_rails_initialization" do |app|
      ActionController::Base.helper LiveSlides::Helper
    end
  end
end
