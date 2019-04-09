require './src/data/repositories/person_repository'

module Template
    module Presentation
        module Ioc
            class RegisterBusinessRepositories
                def self.execute(container)
                    container.register(:person_repository, Data::Repositories::PersonRepository.new)
                end
            end
        end
    end
end