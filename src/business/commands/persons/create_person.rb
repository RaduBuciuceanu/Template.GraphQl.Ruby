module Template
    module Business
        module Commands
            module Persons
                class CreatePerson
                    def initialize(person_input_to_person, person_repository)
                        @person_input_to_person = person_input_to_person
                        @person_repository = person_repository
                    end

                    def execute(person_input)
                        person = @person_input_to_person.execute(person_input)
                        @person_repository.insert(person)
                    end
                end
            end
        end
    end
end