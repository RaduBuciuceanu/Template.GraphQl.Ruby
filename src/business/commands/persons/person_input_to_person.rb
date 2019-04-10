module Template
    module Business
        module Commands
            module Persons
                class PersonInputToPerson
                    def initialize(generate_id)
                        @generate_id = generate_id
                    end

                    def execute(person_input)
                        person = Models::Person.new
                        person.id = @generate_id.execute
                        person.first_name = person_input.first_name
                        person.last_name = person_input.last_name
                        person
                    end
                end
            end
        end
    end
end