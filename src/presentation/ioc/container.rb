require 'dry-container'
require './src/presentation/ioc/register_business_commands'
require './src/presentation/ioc/register_business_repositories'

module Template
    module Presentation
        module Ioc
            class Container
                extend Dry::Container::Mixin

                RegisterBusinessRepositories::execute self
                RegisterBusinessCommands::execute self
            end
        end
    end
end
