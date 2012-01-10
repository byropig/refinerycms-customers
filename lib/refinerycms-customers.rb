require 'refinerycms-base'

module Refinery
  module Customers

    class << self
      attr_accessor :root
      def root
        @root ||= Pathname.new(File.expand_path('../../', __FILE__))
      end
    end

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end
      
      initializer 'Customer.helper' do |app|
        ActionView::Base.send :include, Refinery::Customers::AddressHelper
      end
            
      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "customers"
          plugin.pathname = root
          plugin.activity = {
            :class => Customer,
            :title => 'name'
          }
        end
      end
    end
  end
end
