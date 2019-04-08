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
                    @persons.each {|person| person.id == id}.first
                end
            end
        end
    end
end