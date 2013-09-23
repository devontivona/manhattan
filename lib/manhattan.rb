module Neat
  if defined?(Rails) and defined?(Rails::Engine)
    class Engine < ::Rails::Engine
      require 'manhattan/engine'
    end
  end
end