module Template
    module Business
        module Commands
            module Persons
                class GetPerson
                    def initialize(person_repository)
                        @person_repository = person_repository
                    end

                    def execute(id)
                        @person_repository.get(id)
                    end
                end
            end
        end
    end
end