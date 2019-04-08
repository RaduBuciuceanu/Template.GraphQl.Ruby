require './src/business/repositories/person_repository'

module Template
    module Data
        module Repositories
            class PersonRepository < Business::Repositories::PersonRepository
                def initialize
                    @persons = []
                end

                def insert(person)
                    @persons << person
                    person
                end

                def get(id)
                    found = @persons.select {|person| person.id == id}

                    if found.empty?
                        raise ArgumentError.new 'Id does not exist.'
                    end

                    found.first
                end
            end
        end
    end
end