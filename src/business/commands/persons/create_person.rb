module Business
    module Commands
        module Persons
            class CreatePerson
                private

                @person_repository

                public

                def initialize(person_repository)
                    @person_repository = person_repository
                end

                def execute(person)
                    @person_repository.insert(person)
                end
            end
        end
    end
end
