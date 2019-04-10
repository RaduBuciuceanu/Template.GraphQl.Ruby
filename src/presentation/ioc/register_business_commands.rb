require './src/business/commands/persons/create_person'
require './src/business/commands/persons/get_person'
require './src/business/commands/generate_id'
require './src/business/commands/persons/person_input_to_person'

module Template
    module Presentation
        module Ioc
            class RegisterBusinessCommands
                def self.execute(container)
                    container.register(:generate_id, Business::Commands::GenerateId.new)
                    container.register(:person_input_to_person, Business::Commands::Persons::PersonInputToPerson.new(container[:generate_id]))
                    container.register(:create_person, Business::Commands::Persons::CreatePerson.new(container[:person_repository]))
                    container.register(:get_person, Business::Commands::Persons::GetPerson.new(container[:person_repository]))
                end
            end
        end
    end
end
